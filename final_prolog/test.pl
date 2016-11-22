% Aurelio Arango
% CS571
% Expert System that allows the user to search for a disease
% <----- HUMANS or PETS Diseases
% <----- CAUSES, SYMPTOMS, TREATMENTs


top_s :- write('Disease name?: '),
  search(Disease, Causes(C), Symptoms(S)),
  write(C),tab(1),write(S),nl.

% Disease: canine distemper
% Causes: Virus
% Symptoms: runny eyes, fever, snotty nose, coughing, vomiting diarrihea, seizures, paralysis
% Prevention: Prevented with core-vaccine, routine cleaning, drying,
% Treatment: Lots of fluids, electrolites, analgesicts, antibiotics

% Diease: canine influenza
% Causes: Influenzavirus A, equine influenza
% Symptoms: coughing from 10-30 dyas, greenish nasal discharged, high fever, pneumonia
% Prevention: Vaccine, check with veterinarian
% Treatment:  Vaccine

% Diease: Parvo
% Causes: canine parvovirus type 2
% Symptoms: gastrointestinal system ,fever, vomiting, bloody-diarrihea,
% Cure: Prevented with core-vaccine

% Diease: Heartworms
% Causes: mosquitoes
% Symptoms:  coughing, lethargy, difficulty breathing, heart disease, death
% Cure: Consult veterinarian

% Diease: Heatstroke
% Causes: Hot and warm weather
% Symptoms: Excessive panting, drooling, anxiousness, weakness, abnormal gum color dark-red or purple, collapse, death
% Cure: Take to shade area, cool body with cold water, take to veterinarian

% Diease: Intestinal Parasites
% Causes: eat contaminated soil, lick contaminated fur or paws, drink contaminated water
% Symptoms: Malnutrition, diarrihea,
% Cure: Consult veterinarian

% Diease: Coccidia and Giardia
% Causes: eating infected soil, licking contaminated paws or fur
% Symptoms: damage lining of instestine,
% Cure: See veterinarian

% Diease: Kennel cough
% Causes: virus and bacteria, contact with other dogs
% Symptoms: snotty nose, dry hacking cough
% Cure: Consult veterinarian for Vaccine

% Diease: Leptospirosis
% Causes: Leptospira bacteria shed in the urine, contaminated water, soil or food
% Symptoms: fever, muscle weakness, vomiting, lethargy, abdominal pain, and kiney or liver failure.
% Cure: Consult veterinarian

% Diease: Rabies
% Causes: Virus spread by saliva, bite from infected animal, saliva on skin wound
% Symptoms: fatal
% Cure: Vaccination

% Diease: Ringworm
% Causes: fungal infection of the skin,
% Symptoms: circular patch of hair loss, excessive scratch
% Cure: recover without treatment, vaccine to prevent spreading

% Diease: Tick-borne disease
% Causes: Specific areas, tick bites
% Symptoms: anemia, lameness, weakness, lethargy, organ failure, death
% Cure: Remove ticks as soon as possible, contact veterinarian

% Diease: Toxi plants - Cocoa
% Causes: Ornamental plants
% Symptoms:
% Cure: Poison control center

% Diease: Cryptosporidiosis
% Causes: microscopic parasite, spread fecal-oral route, human contagious
% Symptoms: stomach cramps, diarrihea, vominting, fever
% Cure:

% Diease: Echinococcosis
% Causes: tapeworms, can infect people, fecal matter,
% Symptoms: respiratory and digestive problems
% Cure:

% Diease: Hookworms
% Causes: eating larvae, contaminated soil, infected dog,
% Symptoms: Lung, liver, brain damage, if enters the eye blindness
% Cure: Prevented by washing hands,
