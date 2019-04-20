% Source code comilation script
% Usage: This is usable on MATLAB and OCTAVE for compiling the source files
function make()
    clear; clc;
    try
        % Compilation using OCTAVE
        if(exist('OCTAVE_VERSION', 'builtin'))
%             mkoctfile --mex -g -I.. -I./others -I./problems -I./methods mexfiles/interface.cpp problems/*.cpp methods/stron.cpp others/helpers.cpp
            mkoctfile --mex -g -I./others -I./problems -I./methods mexfiles/interface.cpp problems/*.cpp methods/*.cpp others/helpers.cpp
        else
        % Compilation using MATLAB
        % Need to add -largeArrayDims on 64-bit machines of MATLAB
            mex CFLAGS="\$CFLAGS -std=c99" -g -I./others -I./problems -I./methods -largeArrayDims mexfiles/interface.cpp problems/*.cpp methods/*.cpp others/helpers.cpp            
        end
    catch err
        fprintf('Error in Compilation: %s failed (line %d)\n', err.stack(1).file, err.stack(1).line);
        disp(err.message);
    	fprintf('Please read README for help.\n');
    end
end