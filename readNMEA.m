    function out=readNMEA(file,type)
    tic
    A = importfile(file,type);
    toc
    tic
    db=1;
    for ji=1:size(A,1)
        if A{ji,3}==1
            db=db+A{ji,4}+1;
        end
    end
    data=cell(db,3);
    k=1;
    for i=1:size(A,1)
        if A{i,3}==1
        lines=floor(A{i,4}/4)+1;
        dev=cell(1,3);
        dev{1,1}=0;
        dev{1,2}=0;
        dev{1,3}=0;
        data(k,:)=dev;
        k=k+1;
        end
    if A{i,3}~=lines
        o=4;
    else 
        o=A{i,4}-(A{i,3}-1)*4;
    end
    for j=1:o
    data(k,:)=A(i,1+j*4:3+j*4);
    k=k+1;
    end
    end
    out=cell2mat(data(1:k-1,:));
    clear A data db i j ji k lines n o sizeA
    toc