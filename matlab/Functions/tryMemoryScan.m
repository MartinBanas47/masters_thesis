function [newHitCnt, newMemMax] = tryMemoryScan(iHitCnt, iMemMax)
  newHitCnt = iHitCnt + 1;
  
  lMem = memory;
  lMem = (lMem.MemUsedMATLAB);
  if lMem > iMemMax
    newMemMax = lMem;
  else
    newMemMax = iMemMax;
  end
end