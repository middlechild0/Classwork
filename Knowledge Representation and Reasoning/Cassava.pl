
symptom(cassava, mosaic_virus, yellowing_of_leaves).
symptom(cassava, mosaic_virus, mosaic_pattern_on_leaves).
symptom(cassava, brown_streak_disease, brown_streaks_on_stems).
symptom(cassava, brown_streak_disease, yellowing_of_veins).
symptom(cassava, bacterial_blight, wilting_of_leaves).
symptom(cassava, bacterial_blight, dark_rotten_areas_on_stems).

action(mosaic_virus, 'Isolate infected plants to prevent spreading. Apply mosaic-resistant varieties if available.').
action(brown_streak_disease, 'Remove and destroy infected plants. Use disease-free planting materials.').
action(bacterial_blight, 'Prune affected leaves and destroy them. Apply copper-based fungicides.').


detect_disease(Symptoms, Disease, Action) :-
    member(Disease, [mosaic_virus, brown_streak_disease, bacterial_blight]),
    detect_disease_rules(Symptoms, Disease),
    action(Disease, Action).

detect_disease_rules(Symptoms, mosaic_virus) :-
    member(yellowing_of_leaves, Symptoms),
    member(mosaic_pattern_on_leaves, Symptoms).

detect_disease_rules(Symptoms, brown_streak_disease) :-
    member(brown_streaks_on_stems, Symptoms),
    member(yellowing_of_veins, Symptoms).

detect_disease_rules(Symptoms, bacterial_blight) :-
    member(wilting_of_leaves, Symptoms),
    member(dark_rotten_areas_on_stems, Symptoms).

display_result(Disease, Action) :-
    format('Detected Disease: ~w~n', [Disease]),
    format('Recommended Action: ~w~n', [Action]).


no_disease_detected :-
    write('No disease detected.').


detect_cassava_disease(Symptoms) :-
    detect_disease(Symptoms, Disease, Action),
    display_result(Disease, Action).

detect_cassava_disease(_) :-
    no_disease_detected.