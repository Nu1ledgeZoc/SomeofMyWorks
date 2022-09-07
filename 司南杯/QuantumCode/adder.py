from pyqpanda import *

def encoder(n):    
    if n==-8 :
        return [1,0,0,0]
    if n==-7 :
        return [1,0,0,1]
    if n==-6 :
        return [1,0,1,0]
    if n==-5 :
        return [1,0,1,1]
    if n==-4 :
        return [1,1,0,0]
    if n==-3 :
        return [1,1,0,1]
    if n==-2 :
        return [1,1,1,0]
    if n==-1 :
        return [1,1,1,1]
    if n== 0 :
        return [0,0,0,0]
    if n== 1 :
        return [0,0,0,1]
    if n== 2 :
        return [0,0,1,0]
    if n== 3 :
        return [0,0,1,1]
    if n== 4 :
        return [0,1,0,0]
    if n== 5 :
        return [0,1,0,1]
    if n== 6 :
        return [0,1,1,0]
    if n== 7 :
        return [0,1,1,1]

def get_num_cir(qvec,n,str):
    cir=QCircuit()
    if str == 'a':
        d0=0;
    else:
        d0=4;
    nlist=encoder(n)
    for i in range(0,4):
        if nlist[i]==1:
            cir << X(qvec[i+d0])
    
    return cir
        
    
    
    
def adder(a: int, b: int) -> int:
    mch = init_quantum_machine(QMachineType.CPU)
    qvec = mch.qAlloc_many(8)
    cira=get_num_cir(qvec,a,'a')
    cirb=get_num_cir(qvec,b,'b')
    
    
    return a+b
    pass


