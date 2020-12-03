function ConvergenceCRREven(S,K,r,T,vol,q,IsCall)
N = 25;
BS =  BSPrice(S,K,r,T,vol,q,IsCall);
CRRaprox = zeros(1,N);

% price and steps

    for k = 1:N
        CRRaprox(k)= EuroCRR(S,K,r,T,vol,q,2*k,IsCall);
    end

    
X = 2:2:2*N;    
plot(X,BS * ones(1,N));
hold on;
plot(X,CRRaprox);
hold off;
    
end