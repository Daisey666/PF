%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Instituto Superior Tecnico          %
%                                              %
%             Speech Processing                %
%                                              %
%               Laboratorio - 3                %
%   Part 2 - Formant synthesis using Matlab    %
%                                              %
%                  Group 8                     %
%                                              %
%      Student - Jose  Oliveira - Nr 75255     %
%      Student - Ruben Tadeia   - Nr 75268     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%FormantSynthesis -> used to produce a synthesized vowel
%   FormantSynthesis(vowel, f0, duration, intensity)
%
%   vowel is an integer value between 1 and the duration*100
%   f0
%   duration
%   intensity

function synth = FormantSynthesis(vowel, f0, duration, intensity)

    %Loading file from wavesurfer    
    filename = 'ola';
    
    %Garantee the mat file is present in same directory
    try
        file = strcat(filename, '.mat');
        formants = load(file, '-ascii');
    catch Exception
        if (strcmp(Exception.identifier,'MATLAB:load:couldNotReadFile'))
            msg = ['File ', filename, '.mat does not exist'];
            causeException = MException('MATLAB:FormantSynthesis:load',msg);
            Exception = addCause(Exception,causeException);
        end
            rethrow(Exception)
    end
    
    Fs = 8000;
    T0 = 1/f0;
    T0_samples = floor(Fs*T0); % Round towards minus infinity
    duration_samples = duration*Fs;
    poleMagnitude = 0.95;
    
    pulse_train = zeros(1, duration_samples);
    for i = 1:T0_samples:duration_samples
        pulse_train(i) = intensity;
    end

    synth = pulse_train;
    for i = 1:4
        Ck = -poleMagnitude^2;
        Bk = 2*poleMagnitude*cos(2*pi*formants(vowel, i)/Fs);
        Ak = 1 - Bk - Ck;
        synth = filter(Ak, [1 -Bk -Ck], synth);
        audiowrite('formant_synthesis_fixed.wav',synth,Fs);
    end
end