from pyqpanda import *
from numpy import pi
from typing import List
from numpy import abs

def solution() -> List[List[complex]]:
    ## cir1
    qvm=init_quantum_machine(QMachineType.CPU)
    qubits = qvm.qAlloc_many(4)
    # 构建量子程序

    prog1 = QProg()
    prog2 = QProg()
    prog3 = QProg()
    cir_ini1=QCircuit()
    cir_ini2=QCircuit()
    cir_ini3=QCircuit()
    cir_ini1 << apply_QGate(qubits,H)

    cir_ini2 << apply_QGate(qubits,H) << apply_QGate(qubits,Z)

    cir_ini3 << apply_QGate(qubits,RYpiOVER3)

    cir_comgate=QCircuit()


    cir_comgate <<CNOT(qubits[1],qubits[0])\
            <<RZ(qubits[0],0.785398)\
            <<CNOT(qubits[1],qubits[0])\
            <<CNOT(qubits[2],qubits[1])\
            <<RZ(qubits[1],0.785398)\
            <<CNOT(qubits[2],qubits[1])\
            <<CNOT(qubits[3],qubits[2])\
            <<RZ(qubits[2],0.785398)\
            <<CNOT(qubits[3],qubits[2])

    prog1 << cir_ini1 << cir_comgate
    prog2 << cir_ini2 << cir_comgate
    prog3 << cir_ini3 << cir_comgate
    result = qvm.prob_run_dict(prog1, qubits, -1)
    phi1=get_qstate()
    result = qvm.prob_run_dict(prog2, qubits, -1)
    phi2=get_qstate()
    result = qvm.prob_run_dict(prog3, qubits, -1)
    phi3=get_qstate()
    finalize()






    ## cir2
    qvm=init_quantum_machine(QMachineType.CPU)
    qAsist=qvm.qAlloc_many(1)

    proga1 = QProg()
    proga2 = QProg()
    proga3 = QProg()
    cir_ini_a2=QCircuit()
    cir_ini_a1=QCircuit()
    cir_ini_a3=QCircuit()
    cir_ini_a1 << apply_QGate(qAsist[0],H)
    cir_ini_a2 << apply_QGate(qAsist[0],H) << apply_QGate(qAsist[0],Z)
    cir_ini_a3 << apply_QGate(qAsist[0],RYpiOVER3)




    proga1 << cir_ini_a1
    proga2 << cir_ini_a2
    proga3 << cir_ini_a3

    #量子程序运行，并返回测量结果
    a1=qvm.prob_run_dict(proga1, qAsist, -1)
    c1=get_qstate()
    a2=qvm.prob_run_dict(proga2, qAsist, -1)
    c2=get_qstate()
    a3=qvm.prob_run_dict(proga3, qAsist, -1)
    c3=get_qstate()
    finalize()
    
    return  [sltnReverter(phi1,c1),sltnReverter(phi2,c2),sltnReverter(phi3,c3)]
    pass


def RYpiOVER3(qvec):
    return RY(qvec,pi/3)

def sltnReverter(phi,c):
    apb=c[0]+c[1]
    if abs(apb) <= 1e-8:
        sltn=[phi[i]/c[0] for i in range(0,8)]
        return sltn
    
    sltn=[(phi[i]+phi[i+8])/apb for i in range(0,8)]
    # sltn = [valist()]
    return sltn


print(solution())