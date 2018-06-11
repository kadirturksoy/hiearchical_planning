function [descriptor] = invariant_desc(data)
%Burada bubble descriptor la aynı metodla invariant descriptor hesaplattım.
%Burada kullandığım yöntemin matematiksel olarak eskisiyle aynı olduğunu
%kanıtladığım için direkt fft yöntemi kullandım. Gerçi row ve col 2 nin
%kuvveti olmadığı için işime yaradı mı o ayrı mesele.
    descriptor=zeros(1,100);
    [rows,cols]=size(data);
    a1=rows*cols*ifft2(data);
    y=rows*ifft(data);
    a2=fft(y')';
    cc=(real(a1)+real(a2))/2;
    cs= (imag(a1)+imag(a2))/2;
    sc=(imag(a1)-imag(a2))/2;
    ss=real(a2)-cc;
    I=cc.*cc+cs.*cs+sc.*sc+ss.*ss;
    for i=1:10
        for j=1:10
            descriptor(1,10*(i-1)+j)=I(i,j);
        end
    end
end

