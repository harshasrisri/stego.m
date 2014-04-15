classdef transImage
    properties
        bef
        aft
        LL
        LH
        HL
        HH
        sz
        wname
        mse
        psnr
        maxerr
        l2rad
        errors
    end
    
    methods
        function ti = transImage (img, wname)
            if nargin > 0
                ti.bef = img;
                ti.sz = size(img);
                ti.wname = wname;
                [ti.LL, ti.LH, ti.HL, ti.HH] = dwt2 (ti.bef, ti.wname);
            end
        end
        
        function ti = finalize (ti, filename)
            ti.aft = idwt2 (ti.LL, ti.LH, ti.HL, ti.HH, ti.wname, ti.sz);
            if nargin == 2
                ti.aft = uint8(ti.aft);
                imwrite (ti.aft, filename); %, 'Mode', 'lossless');
            end
            [ti.psnr, ti.mse, ti.maxerr, ti.l2rad] = measerr (ti.aft, ti.bef);
        end
        
        function showimgs(ti)
            figure
            subplot (2,1,1)
            imshow (ti.bef);
            subplot (2,1,2)
            imshow (ti.aft);
        end
    end
end
