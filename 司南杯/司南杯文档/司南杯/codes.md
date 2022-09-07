
```                                                    python
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



```
