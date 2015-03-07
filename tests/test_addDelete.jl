# tests to debug addHybridizationUpdateSmart
# and deleteHybridizationUpdate
# Claudia March 2015


# starting topology: Case G
include("../case_g_example.jl");
currT = deepcopy(net);
printEdges(currT)

# real network: Case H
df = readtable("CaseH_output.csv")
d = readDataCF(df)

currloglik,currxmin = optBL!(currT,d)
newT = deepcopy(currT);
count = 0
N = 100
move = whichMove(currT)
move = :CHdir
move = :MVorigin
move = :MVtarget
move = :nni

flag = proposedTop!(move,newT,true,count,N)
printEdges(newT)
printNodes(newT)

newloglik, newxmin = optBL!(newT,d)
isValid(newT)
node=searchHybridNode(newT);
node[1].number
deleteHybridizationUpdate!(newT,node[1])
addHybridizationUpdate!(newT)


afterOptBL!(newT,d)
currT=deepcopy(newT);

