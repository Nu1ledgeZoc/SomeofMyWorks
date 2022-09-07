#import pyqpanda as pq
#将问题转化为优化问题，并使用nelder mead优化器求解
from pyqpanda import *
import numpy as np
global sltn
sltn=[]
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
# def simpleJug():
#     #需要在pblmReceiver后调用 mei luan yong
#     #有一种简单的情况是总共会被检查的层的个数大于a，则一定无解
#     iflag=[[False,False] for i in range(0,numa)]
#     for i in range(0,numa):
#         for j in range(0,numb):
#             if check[j][i]==1:
#                 iflag[i][0]=True
#             if check[j][i]==-1:
#                 iflag[i][1]=True
                
#     return np.sum(iflag) > numa
            
    


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
                
    
def lossFunc2(para,grad=1,inter=1,fcall=1):
    #最大化解的个数
    
    
     return "",1/para

def isinsltn(para):
    #判断该解是不是已经存在于sltn中，是则返回True
    for i in range(0,len(sltn)):
        if set(sltn[i][:]) == set(para):
            return True


def addsltn(para):
    sltn=[sltn[:],para]

def lossFunc(para,grad,inter,fcall):
    #返回不合格的车厢数，作为损失函数
    #para为一个可能的组合。维度为a的行向量
    para=[int(i) for i in para]
    loss=0
    
    for i in range(0,numb):
        jug=(set(oringinCheck[i][:]) & set(para))
        if  (not bool(jug)) :
            #如果这一次各个车厢都找不到通行证
            loss=loss+1
    
    return "",loss

if __name__ == "__main__": 
    pblmReceiver()   #无参数时默认输入题目所给案例
    optimizer = OptimizerFactory.makeOptimizer('NELDER_MEAD')

    init_para = [-1, 2]
    optimizer.registerFunc(lossFunc, init_para)
    optimizer.setXatol(1e-6)
    optimizer.setFatol(1e-6)
    optimizer.setMaxIter(200)
    optimizer.exec()

    result = optimizer.getResult()
    print(result.message)
    print(" Current function value: ", result.fun_val)
    print(" Iterations: ", result.iters)
    print(" Function evaluations: ", result.fcalls)
    print(" Optimized para: W: ", result.para[0], " b: ", result.para[1])
