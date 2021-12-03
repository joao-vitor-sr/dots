set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

" TABS
au BufReadPost,BufNewFile /home/joao-vitor-sr/codes/php/desenvolvimento/* set tabstop=2 shiftwidth=2 expandtab smarttab

autocmd TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank {higroup='Visual', timeout=500}

