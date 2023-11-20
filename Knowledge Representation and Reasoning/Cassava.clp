(deffacts cassava-symptoms
    (symptom cassava mosaic_virus yellowing_of_leaves)
    (symptom cassava mosaic_virus mosaic_pattern_on_leaves)
    (symptom cassava brown_streak_disease brown_streaks_on_stems)
    (symptom cassava brown_streak_disease yellowing_of_veins)
    (symptom cassava bacterial_blight wilting_of_leaves)
    (symptom cassava bacterial_blight dark_rotten_areas_on_stems)
)

(deffacts recommended-actions
    (action mosaic_virus "Isolate infected plants to prevent spreading. Apply mosaic-resistant varieties if available.")
    (action brown_streak_disease "Remove and destroy infected plants. Use disease-free planting materials.")
    (action bacterial_blight "Prune affected leaves and destroy them. Apply copper-based fungicides.")
)

(defrule detect-disease
    (symptom cassava ?disease ?symptom)
    (symptom cassava ?disease ?other-symptom&:(neq ?symptom ?other-symptom))
    =>
    (assert (detected-disease ?disease))
)

(defrule display-result
    ?f <- (detected-disease ?disease)
    ?a <- (action ?disease ?action)
    =>
    (printout t "Detected Disease: " ?disease crlf)
    (printout t "Recommended Action: " ?action crlf)
    (retract ?f)
    (retract ?a)
)

(defrule no-disease-detected
    =>
    (printout t "No disease detected." crlf)
)

(deffunction detect-cassava-disease (?symptoms)
    (assert (detected-disease nil))
    (foreach ?symptom ?symptoms
        (assert (symptom cassava unknown ?symptom))
    )
    (run)
    (retract (detected-disease nil))
    (retract (symptom cassava unknown ?))
)

