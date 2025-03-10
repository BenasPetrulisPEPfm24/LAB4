close all
clear all
clc
%% raidþiø pavyzdþiø nuskaitymas ir poþymiø skaièiavimas
%% read the image with hand-written characters
pavadinimas = 'Benas_Petrulis4N.png';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 4);
%% Atpaþintuvo kûrimas
%% Development of character recognizer

% poþymiai ið celiø masyvo perkeliami á matricà
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teisingø atsakymø matrica: 13 raidþiø, 4 eilutës mokymui
% create the matrices of correct answers for each line (number of matrices = number of symbol lines)
T = [eye(13), eye(13), eye(13), eye(13)];
% sukuriamas SBF tinklas duotiems P ir T sàryðiams
% create an RBF network for classification with 13 neurons, and sigma = 1
tinklas = newrb(P,T,0,1,12);


%% Tinklo patikra | Test of the network (recognizer)
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
P2 = P(:,14:26);
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
%% Visualize result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
% we will save the result in variable 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, 'B'];
        case 2
            atsakymas = [atsakymas, 'e'];
        case 3
            atsakymas = [atsakymas, 'N'];
        case 4
            atsakymas = [atsakymas, 'A'];
        case 5
            atsakymas = [atsakymas, 'S'];
        case 6
            atsakymas = [atsakymas, 'p'];
        case 7
            atsakymas = [atsakymas, 'E'];
        case 8
            atsakymas = [atsakymas, 'T'];
        case 9
            atsakymas = [atsakymas, 'R'];
        case 10
            atsakymas = [atsakymas, 'U'];
        case 11
            atsakymas = [atsakymas, 'L'];
        case 12
            atsakymas = [atsakymas, 'I'];
        case 13
            atsakymas = [atsakymas, 'S'];
    end
end
% pateikime rezultatà komandiniame lange
% show the result in command window
disp(atsakymas)
% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)


%% þodþio "KADA" poþymiø iðskyrimas 
%% Extract features of the test image
pavadinimas = 'Benas.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidþiø atpaþinimas
%% Perform letter/symbol recognition
% poþymiai ið celiø masyvo perkeliami á matricà
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimating neuran network output for newly estimated features
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% searching which output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'B'];
        case 2
            atsakymas = [atsakymas, 'e'];
        case 3
            atsakymas = [atsakymas, 'N'];
        case 4
            atsakymas = [atsakymas, 'A'];
        case 5
            atsakymas = [atsakymas, 'S'];
        case 6
            atsakymas = [atsakymas, 'p'];
        case 7
            atsakymas = [atsakymas, 'E'];
        case 8
            atsakymas = [atsakymas, 'T'];
        case 9
            atsakymas = [atsakymas, 'R'];
        case 10
            atsakymas = [atsakymas, 'U'];
        case 11
            atsakymas = [atsakymas, 'L'];
        case 12
            atsakymas = [atsakymas, 'I'];
        case 13
            atsakymas = [atsakymas, 'S'];
    end
end
% pateikime rezultatà komandiniame lange
disp(atsakymas)
%figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off



%% þodþio "FIKCIJA" poþymiø iðskyrimas
%% extract features for next/another test image
pavadinimas = 'Turtas.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidþiø atpaþinimas
% poþymiai ið celiø masyvo perkeliami á matricà
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, 'B'];
        case 2
            atsakymas = [atsakymas, 'e'];
        case 3
            atsakymas = [atsakymas, 'N'];
        case 4
            atsakymas = [atsakymas, 'A'];
        case 5
            atsakymas = [atsakymas, 'S'];
        case 6
            atsakymas = [atsakymas, 'p'];
        case 7
            atsakymas = [atsakymas, 'E'];
        case 8
            atsakymas = [atsakymas, 'T'];
        case 9
            atsakymas = [atsakymas, 'R'];
        case 10
            atsakymas = [atsakymas, 'U'];
        case 11
            atsakymas = [atsakymas, 'L'];
        case 12
            atsakymas = [atsakymas, 'I'];
        case 13
            atsakymas = [atsakymas, 'S'];
    end
end
% pateikime rezultatà komandiniame lange
disp(atsakymas)
%figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off

%}
