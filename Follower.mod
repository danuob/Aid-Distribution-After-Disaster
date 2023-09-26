/*********************************************
 * OPL 12.7.1.0 Model
 * Author: Dan
 * Creation Date: 12 Sep 2023 at 13:21:26
 *********************************************/
range A = 1..16;
range B = 1..6;
range C = 1..13;
range P = 1..2;
dvar int x[A][B][P];
dvar int y[B][C][P];
int t1[A][B] = ...;
int t2[B][C] = ...;
int T1[A][B][P];
int T2[B][C][P];
float D[C][P] = ...;
int M[A][P] = ...;
float v[A]= ...;
minimize sum(a in A, b in B, p in P)x[a][b][p]*v[a];
subject to
{
forall(a in A, b in B, p in P)
  {
  (x[a][b][p]>=1 && t1[a][b]!=0) => T1[a][b][p]==t1[a][b];
}
forall(b in B, c in C, p in P)
  {
  (y[b][c][p]>=1 && t2[b][c]!=0) => T2[b][c][p]==t2[b][c];
}
forall(c in C, p in P)
  {
 sum(b in B)y[b][c][p] >= D[c][p]; 
}
forall(b in B, p in P)
  { 
 sum(a in A)x[a][b][p] == sum(c in C) y[b][c][p];
} 
forall(a in A, p in P)
  {
 sum(b in B)x[a][b][p] <=M[a][p]; 
}
forall(a in A, b in B, p in P)
  {
 x[a][b][p]>=0;
}
forall(b in B, c in C, p in P)
  {
 y[b][c][p]>=0;
}
}