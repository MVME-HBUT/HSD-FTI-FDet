Pathroot = ['your_config_path'];
datasets = {'BBK_HALF'};    
for t = 1:length(datasets)
    dataset = datasets{t};
    txtsavepath = fullfile('your_result_path');
    if ~exist(txtsavepath,'dir'), mkdir(txtsavepath); end

    %list = dir(fullfile(Pathroot,dataset));
    list = dir(fullfile(Pathroot));
    Filenum = size(list,1);
    for i = 3:Filenum
        filename = list(i).name;
        fprintf('Method %s in %s dataset is starting!\n',filename,dataset);
        ffid = fopen(fullfile(Pathroot,dataset,filename),'r');
        while ffid ==-1
            ffid = fopen(fullfile(Pathroot,filename),'r');
        end
            
        ffid0 = fopen(['GT',datasets{t},'.txt'],'r');
        fcal = fopen(fullfile(txtsavepath,filename),'w'); 
        j = 1; e = 0; f = 0; m = 0;
        while feof(ffid) == 0 && feof(ffid0) == 0
            tline1{j,1} = deblank(fgetl(ffid)); 
            tline0{j,1} = deblank(fgetl(ffid0)); 
            cr = regexp(tline1{j,1},'\s+','split');
            cr0 = regexp(tline0{j,1},'\s+','split');
            if length(cr0)<3
                bboxs = [0,0,0,0];
            else
                %bboxs = [str2num(cr{3}),str2num(cr{4}),str2num(cr{5}),str2num(cr{6})];
                bboxs = [str2num(cr{9}),str2num(cr{10}),str2num(cr{11}),str2num(cr{12})];
                bbox_gt = [str2num(cr0{3}),str2num(cr0{4}),str2num(cr0{5}),str2num(cr0{6})];
            end
            %if (str2num(cr0{2})==0 && str2num(cr{3})~=0)
                %f = f+1; fprintf(fcal,'%s\n',[cr{1},' False detection']);
                
            %elseif (str2num(cr0{2})>0 && str2num(cr{3})==0)
                %m = m+1; fprintf(fcal,'%s\n',[cr{1},' MISSING detection']);
            
            %elseif (str2num(cr0{2})>0 && str2num(cr{3})>0 &&...
                %abs(bboxs(1)-bbox_gt(1))>20 && abs(bboxs(2)-bbox_gt(2))>20)
                %e = e+1; fprintf(fcal,'%s\n',[cr{1},' may be Error location. Please check!']);
                
            if (str2num(cr0{2})==0 && str2num(cr{9})~=0)
                f = f+1; fprintf(fcal,'%s\n',[cr{7},' False detection']);

            elseif (str2num(cr0{2})>0 && str2num(cr{9})==0)
                m = m+1; fprintf(fcal,'%s\n',[cr{7},' MISSING detection']);
                
            elseif (str2num(cr0{2})>0 && str2num(cr{9})>0 &&...
                abs(bboxs(1)-bbox_gt(1))>20 && abs(bboxs(2)-bbox_gt(2))>20)
                e = e+1; fprintf(fcal,'%s\n',[cr{7},' may be Error location. Please check!']);

            end

            j = j+1;
        end
        fprintf(fcal,'%s\n','---************-----------Calculation results-----------************---');
        fprintf(fcal,'%s\n',['False detection(<10%) is ',num2str(f)]);
        fprintf(fcal,'%s\n',['MISSING detection(<5%) is ',num2str(m)]);
        fprintf(fcal,'%s\n',['Error location is ',num2str(e)]);
        fclose(fcal);
        ft(i,1)=f;
        ft(i,2)=m;
        ft(i,3)=e;
        ft(i,4)=round(double(f/2897),4);
        ft(i,5)=round(double(m/2897),4);
        ft(i,6)=round(double(1-(f/2897 + m/2897)),4);
    end
    xlswrite([txtsavepath,'data.xls'],ft)
end
% end