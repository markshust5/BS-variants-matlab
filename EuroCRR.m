function Price = EuroCRR(S,K,r,T,vol,q,N,IsCall)
%European cox ross rubenstin with N steps bionomial tree
    
    if IsCall
        Intrinsic = @(S) max(0 , S - K);
    else
        Intrinsic = @(S) max(0 , K - S);
    end    
    
%CRR
dT= T/N;
u = exp(vol * dT^.5);
d=1/u;
p = (exp((r-q)*dT) - d)/(u-d);

%binomial Tree
Sum = 0;
    for k = 0:N
        Sum = Sum + (nchoosek(N,k)*p^k*(1-p)^(N-K))*Intrinsic(S*(u^k)*(d^(N-k)));

    end    
        

Price = exp(-r*T)*Sum ;

    
end