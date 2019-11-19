%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CS 251: homework 5
% Name: Austen Nelson
% Due: 11/19/19
%
% The files homework5.pl, potter.pl, and content.pl
% are relavant
%
% This file provides the rules for Harry Potter
% family tree. Married predicate is (husband, wife)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
male(charius_potter).
male(fleamont_potter).
male(james_potter).
male(harry_potter).
male(albus_potter).
male(james_potter_jr).
male(benjamin_evans).
male(vernon_dursley).
male(dudley_dursley).
male(septimus_weasley).
male(ron_weasley).
male(fred_weasley).
male(george_weasley).
male(bill_weasley).
male(bilius_weasley).
male(arthur_weasley).
male(charlie_weasley).
male(percy_weasley).
male(dominique_weasley).
male(lousi_weasley).
male(hugo_weasley).
male(fred_weasley_jr).
male(neville_longbottom).
male(algie_longbottom).
male(frank_longbottom).
male(harfang_longbottom).
male(barty_crouch).
male(barty_crouch_jr).
male(caspar_crouch).
male(marvolo_gaunt).
male(morfin_gaunt).
male(tom_riddle_sr).
male(tom_marvolo_riddle).
male(monsieur_delacour).
male(arcturus_black).
male(draco_malfoy).
male(scorpius_malfoy).
male(lucius_malfoy).
male(ted_lupin).
male(abraxas_malfoy).
male(cygnus_black).
male(ted_tonks).
male(remus_lupin).
male(rodolphus_lestrange).
male(rabastan_lestrange).
male(sirius_black).
male(regulus_black).
male(ignatius_prewett).
male(orion_black).
male(lestrange_sr).
male(alphard_black).
male(pollux_black).
male(marius_black).
male(regulus_black).
male(sirius_black_sr).
male(phineas_black).
male(cygnus_black_sr).
male(phineas_nigellus_black).
male(jimbo_bilshwick).
male(cygnus_black_I).
male(articus_black_I).
male(licorus_black).
male(arctus_black).
male(regulus_black_sr).
male(herbert_burke).

female(dorea_black).
female(lily_potter).
female(lily_potter_jr).
female(petunia_dursley).
female(calidora_black).
female(cedrella_black).
female(charis_black).
female(augusta_longbottom).
female(alice_longbottom).
female(hannah_abbott).
female(merope_gaunt).
female(apolline_delacour).
female(gabrielle_delacour).
female(fleur_delacour).
female(victoire_weasley).
female(molly_weasley).
female(audrey_weasley).
female(ginny_weasley).
female(roxanne_weasley).
female(rose_weasley).
female(molly_weasley_jr).
female(lucy_weasley).
female(lily_weasley_jr).
female(lysandra_yaxley).
female(angelina_johnson).
female(hermione_granger).
female(astoria_greengrass).
female(narcissa_black).
female(nymphadora_tonks).
female(druella_rosier).
female(bellatrix_lestrange).
female(cassiopeia_black).
female(walburga_black).
female(lucretia_black).
female(melania_macmillian).
female(hesper_gamp).
female(lycoria_black).
female(ursula_black).
female(elladora_black).
female(isla_black).
female(misapinoa_black).
female(ella_max).
female(magenta_tripe).
female(belvina_black).
female(andromeda_black).
female(irma_crabbe).
female(violetta_bulstrode).

parent(charius_potter, fleamont_potter).
parent(dorea_black, fleamont_potter).
parent(fleamont_potter, james_potter).
parent(james_potter, harry_potter).
parent(lily_potter, harry_potter).
parent(harry_potter, albus_potter).
parent(harry_potter, james_potter_jr).
parent(harry_potter, lily_potter_jr).
parent(ginny_weasley, albus_potter).
parent(ginny_weasley, james_potter_jr).
parent(ginny_weasley, lily_potter_jr).
parent(benjamin_evans, lily_potter).
parent(benjamin_evans, petunia_dursley).
parent(vernon_dursley, dudley_dursley).
parent(septimus_weasley, bilius_weasley).
parent(septimus_weasley, arthur_weasley).
parent(cedrella_black, bilius_weasley).
parent(cedrella_black, arthur_weasley).
parent(arthur_weasley, ron_weasley).
parent(arthur_weasley, fred_weasley).
parent(arthur_weasley, george_weasley).
parent(arthur_weasley, bill_weasley).
parent(arthur_weasley, charlie_weasley).
parent(arthur_weasley, percy_weasley).
parent(arthur_weasley, ginny_weasley).
parent(molly_weasley, ron_weasley).
parent(molly_weasley, fred_weasley).
parent(molly_weasley, george_weasley).
parent(molly_weasley, bill_weasley).
parent(molly_weasley, charlie_weasley).
parent(molly_weasley, percy_weasley).
parent(molly_weasley, ginny_weasley).
parent(ron_weasley, rose_weasley).
parent(ron_weasley, hugo_weasley).
parent(hermione_granger, rose_weasley).
parent(hermione_granger, hugo_weasley).
parent(george_weasley, roxanne_weasley).
parent(george_weasley, fred_weasley_jr).
parent(angelina_johnson, roxanne_weasley).
parent(angelina_johnson, fred_weasley_jr).
parent(bill_weasley, dominique_weasley).
parent(bill_weasley, lousi_weasley).
parent(bill_weasley, victoire_weasley).
parent(percy_weasley, lucy_weasley).
parent(percy_weasley, molly_weasley_jr).
parent(audrey_weasley, lucy_weasley).
parent(audrey_weasley, molly_weasley_jr).
parent(harfang_longbottom, algie_longbottom).
parent(calidora_black, algie_longbottom).
parent(algie_longbottom, frank_longbottom).
parent(agusta_longbottom, frank_longbottom).
parent(frank_longbottom, neville_longbottom).
parent(alice_longbottom, neville_longbottom).
parent(charis_black, barty_crouch).
parent(caspar_crouch, barty_crouch).
parent(barty_crouch, barty_crouch_jr).
parent(marvolo_gaunt, morfin_gaunt).
parent(marvolo_gaunt, merope_gaunt).
parent(merope_gaunt, tom_marvolo_riddle).
parent(tom_riddle_sr, tom_marvolo_riddle).
parent(monsieur_delacour, gabrielle_delacour).
parent(monsieur_delacour, fleur_delacour).
parent(apolline_delacour, gabrielle_delacour).
parent(apolline_delacour, fleur_delacour).
parent(arcturus_black, cedrella_black).
parent(arcturus_black, charis_black).
parent(arcturus_black, calidora_black).
parent(lysandra_yaxley, cedrella_black).
parent(lysandra_yaxley, charis_black).
parent(lysandra_yaxley, calidora_black).
parent(draco_malfoy, scorpius_malfoy).
parent(astoria_greengrass, scorpius_malfoy).
parent(lucius_malfoy, draco_malfoy).
parent(narcissa_malfoy, draco_malfoy).
parent(remus_lupin, ted_lupin).
parent(nymphadora_tonks, ted_lupin).
parent(abraxas_malfoy, lucius_malfoy).
parent(cygnus_black, bellatrix_lestrange).
parent(cygnus_black, narcissa_malfoy).
parent(cygnus_black, andromeda_black).
parent(durella_rosier, bellatrix_lestrange).
parent(durella_rosier, narcissa_malfoy).
parent(durella_rosier, andromeda_black).
parent(ted_tonks, nymphadora_tonks).
parent(licorus_black, cygnus_black_I).
parent(licorus_black, articus_black_I).
parent(licorus_black, misapinoa_black).
parent(magenta_tripe, cygnus_black_I).
parent(magenta_tripe, articus_black_I).
parent(magenta_tripe, misapinoa_black).
parent(cygnus_black_I, phineas_nigellus_black).
parent(cygnus_black_I, isla_black).
parent(cygnus_black_I, elladora_black).
parent(ella_max, phineas_nigellus_black).
parent(ella_max, isla_black).
parent(ella_max, elladora_black).
parent(ella_max, serius_black_sr).
parent(phineas_nigellus_black, cygnus_black_sr).
parent(phineas_nigellus_black, phineas_black).
parent(phineas_nigellus_black, sirius_black_sr).
parent(phineas_nigellus_black, belvina_black).
parent(phineas_nigellus_black, arcturus_black).
parent(ursula_flint, cygnus_black_sr).
parent(ursula_flint, phineas_black).
parent(ursula_flint, sirius_black_sr).
parent(ursula_flint, belvina_black).
parent(ursula_flint, arcturus_black).
parent(sirius_black_sr, arctus_black).
parent(sirius_black_sr, regulus_black_sr).
parent(sirius_black_sr, lycoria_black).
parent(hesper_gamp, arctus_black).
parent(hesper_gamp, regulus_black_sr).
parent(hesper_gamp, lycoria_black).
parent(cygnus_black_sr, pollux_black).
parent(cygnus_black_sr, cassiopcia_black).
parent(cygnus_black_sr, marius_black).
parent(cygnus_black_sr, dorea_black).
parent(violetta_bulstrode, pollux_black).
parent(violetta_bulstrode, cassiopcia_black).
parent(violetta_bulstrode, marius_black).
parent(violetta_bulstrode, dorea_black).
parent(arctus_black, orion_black).
parent(arctus_black, lucreatia_black).
parent(melania_macmillian, orion_black).
parent(melania_macmillian, lucreatia_black).
parent(orion_black, sirius_black).
parent(orion_black, regulus_black).
parent(walburga_black, sirius_black).
parent(walburga_black, regulus_black).
parent(lestrange_sr, rodolphus_lestrange).
parent(lestrange_sr, rabastan_lestrange).
parent(pollux_black, walburga_black).
parent(pollux_black, alphard_black).
parent(pollux_black, cygnus_black).
parent(irma_crabbe, walburga_black).
parent(irma_crabbe, alphard_black).
parent(irma_crabbe, cygnus_black).

married(tom_riddle_sr, merope_gaunt).
married(harfang_longbottom, calidora_black).
married(caspar_crouch, charis_black).
married(frank_longbottom, alice_longbottom).
married(neville_longbottom, hannah_abbott).
married(monsieur_delacour, apolline_delacour).
married(bill_weasley, fleur_delacour).
married(septimus_weasley, cedrella_black).
married(arthur_weasley, molly_weasley).
married(percy_weasley, audrey_weasley).
married(arcturus_black, lysandra_yaxley).
married(george_weasley, angelina_johnson).
married(ron_weasley, hermione_granger).
married(harry_potter, ginny_weasley).
married(charius_potter, dorea_black).
married(james_potter, lily_potter).
married(herbert_burke, belvina_black).
married(vernon_dursley, petunia_dursley).
married(draco_malfoy, astoria_greengrass).
married(remus_lupin, nymphadora_tonks).
married(ted_tonks, andromeda_black).
married(rodolphus_lestrange, bellatrix_lestrange).
married(ignatius_prewett, lucretia_black).
married(orion_black, walburga_black).
married(lucius_malfoy, narcissa_black).
married(cygnus_black, druella_rosier).
married(arctus_black, melania_macmillian).
married(serius_black_sr, hesper_gamp).
married(pollux_black, irma_crabbe).
married(cygnus_black_sr, violetta_bulstrode).
married(phineas_nigellus_black, ursula_black).
married(cygnus_black_I, ella_max).
married(jimbo_bilshwick, misapinoa_black).
married(licorus_black, magenta_tripe).
