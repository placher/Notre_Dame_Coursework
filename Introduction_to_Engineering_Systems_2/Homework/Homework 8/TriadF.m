function TriadF(handles)
% Play a musical major triad chord

% Author: J. Patrick Lacher
% EG 10112 Section 2 Group 5

%% Set Parameters
duration = str2double(handles.durationText.String);           % length of audio duration, s
add1 = handles.tonicCheckbox.Value;            % adds tonic
add3 = handles.majorthirdCheckbox.Value;           % adds major third
add5 = handles.perfectfifthCheckbox.Value;           % adds perfect fifth
add8 = handles.octaveCheckbox.Value;           % adds octave
playSound = handles.playsoundCheckbox.Value;       % play sound

f1 = handles.frequencySlider.Value;               % tonic frequency, Hz
f3 = f1*(5/4);          % major third frequency, Hz
f5 = f1*(3/2);          % perfect fifth frequency, Hz
f8 = f1*(2);            % octave frequency, Hz

%% Calculate function values

fsample = 8000;         % sample frequency, Hz (8000 for proper audio)
Nsamples = fsample*duration;
t = linspace(0,duration,Nsamples); % time points

y1 = sin(2*pi*f1*t);    % set up sine waves for each frequency
y3 = sin(2*pi*f3*t);
y5 = sin(2*pi*f5*t);
y8 = sin(2*pi*f8*t);

%% Combine to create final signal

y = zeros(1,Nsamples);
% Use a series of if statements to 
if add1
    y = y + y1;
end
if add3
    y = y + y3;
end
if add5
    y = y + y5;
end
if add8
    y = y + y8;
end

% final wave form should be limited to +/- 1 for proper audio
y = y/max(y);

%% Plot function points

% plot first 200 points of waveform
plot(handles.plotAxes,t(1:200),y(1:200))
xlabel(handles.plotAxes,'t')
ylabel(handles.plotAxes,'y')

%% play sound

if playSound
    sound(y)
end