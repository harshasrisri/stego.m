classdef transImageClass
	properties
		bef
		aft
		LL
		LH
		HL
		HH
		sz
		wname
    end
    methods
    function ci = transImageClass (img, wname)
        if nargin > 0
            ci.bef = img;
            ci.wname = wname;
            [ci.LL, ci.LH, ci.HL, ci.HH] = dwt2 (ci.bef, ci.wname);
            ci.aft = idwt2 (ci.LL, ci.LH, ci.HL, ci.HH, ci.wname);
        end
    end
