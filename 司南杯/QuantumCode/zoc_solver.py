import pyqpanda as pq
from pyqpanda.Visualization.circuit_draw import *
import numpy as np
def pblmReceiver(pblmlist=[[2,2],[-1,2,0],[-1,0]]):
    #pblmlist: the given form of pblm
    #numa,numb: the number of a,b
    #check: for inspector i's j check, if the upper,1,downer,-1,dont,0
    global numa,numb    
    numa=pblmlist[0][0]
    numb=pblmlist[0][1]
    global check
    check=np.zeros([numb,numa])
    global oringinCheck
    oringinCheck=[i[:len(i)-1:] for i in pblmlist[1:]]
    for i in range(1,numb+1,1):
        l=len(pblmlist[i])
        for j in range(0,l,1):
            v=pblmlist[i][j]
            absv=np.abs(v)
            if v!=0:
                check[i-1][absv-1]=  v//absv
            else:
                break

def checkSpliter():
    #将上下层检查矩阵拆分为上层检查阵和下层检查阵
    #downMtx[i][j]: 第j+1车厢下层在第i+1关口时，被查记为1.反之记为0
    #upMtx[i][j]: 第j+1车厢上层在第i+1关口时，被查记为1.反之记为0
    global upMtx,downMtx
    upMtx=np.zeros([numb,numa])
    downMtx=np.zeros([numb,numa])
    for i in range(0,numb):
        for j in range(0,numa):
            if check[i][j]==1:
                upMtx[i][j]=1
            else:
                downMtx[i][j]=np.abs(check[i][j])

def isasltn(para):
    #返回不合格的车厢数，作为损失函数
    #para为一个可能的组合。维度为a的行向量
    para=[int(i) for i in para]
       
    for i in range(0,numb):
        if oringinCheck[i]==[]:
            
            continue
        jug=(set(oringinCheck[i][:]) & set(para))
        if  (not bool(jug)) :
            #如果这一次各个车厢都找不到通行证
            return False
    
    return True

def addsltn(para):
    global sltn
    if isasltn(para):
        sltn=sltn+[para]
        
        




def qb2sltn(bstr):
    #单个量子字符向量转化为对应的解向量
    #返回一个列表格式的解
    nb=[int(i) for i in bstr]
    nb=nb[::-1]
    asltn=nb
    for i,obj in enumerate(nb):
        if obj==1:
            asltn[i]=i+1
        else :
            if obj==0:
                asltn[i]=-i-1            
    return asltn

def resultAnalyzer(result):
    # 解的概率均匀分布，说明都是解，即有解
    prob=np.array(list(result.values()))
    # a值大时，各个概率值很小，这里把每个态的期望放大到 1
    prob=prob*len(prob)
    sltnstr=list(result)
    if prob.std() <= 1e-6:
        for i in range(0,len(sltnstr)):
            sltnl=qb2sltn(sltnstr[i])
            addsltn(sltnl)
    else:
        for i in range(0,len(sltnstr)):
            if prob[i] >= 1e-6:
                sltnl=qb2sltn(sltnstr[i])
                addsltn(sltnl)        
    # 解概率分布不均匀，取出较大概率的解检验，并存入sltn，如果实际上不是解，那么sltn还是空表



if __name__ == "__main__":

    global sltn
    sltn=[]
    pblmReceiver([[2,3],[-1,0],[2,0],[1,0]])
    # extreme examples:
    # [2,3],[0],[0],[0] : 所有组合都是解
    # [2,3],[-1,0],[2,0],[1,0] : 没有解
    
    checkSpliter()
    machine = pq.init_quantum_machine(pq.QMachineType.CPU)
    qvec=pq.qAlloc_many(numa)
    cvec=pq.cAlloc_many(numa)
    prog=pq.create_empty_circuit()
    
    dtheta=np.pi/(2*numb)
    for k in range(0,numa):
            prog<<pq.RX(qvec[k],np.pi/2)
    
    
    for i in range(0,numb):
        for k in range(0,numa):
            prog<<pq.RX(qvec[k],check[i][k]*dtheta)
    
    result = pq.prob_run_dict(prog, qvec, -1)
    draw_qprog(prog, 'pic')
    pq.destroy_quantum_machine(machine)
    
    for key in result:
        print(key+":"+str(result[key]))
    
    resultAnalyzer(result)
    print(sltn)
    
    