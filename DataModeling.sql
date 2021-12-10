CREATE TABLE animals(
    animal_id SERIAL PRIMARY KEY,
    animal_name VARCHAR(40),
    species_id INTEGER NOT NULL REFERENCES animal_species(species_id)
);

CREATE TABLE animal_species(
    species_id SERIAL PRIMARY KEY,
    animal_id INTEGER NOT NULL REFERENCES animals(animal_id),
    species_type VARCHAR(50)
);

CREATE TABLE animal_appointments(
    appt_id SERIAL PRIMARY KEY,
    animal_id INTEGER NOT NULL REFERENCES animals(animal_id),
    appt_date DATE,
    appt_time TIMESTAMP,
    appt_type INTEGER NOT NULL REFERENCES appt_types(appt_type_id)
);

CREATE TABLE appt_types(
    appt_type_id SERIAL PRIMARY KEY,
    appt_addoption BOOLEAN DEFAULT TRUE
);

CREATE TABLE adoption_appointments(
    adopt_appt_id SERIAL PRIMARY KEY,
    appt_id INTEGER NOT NULL REFERENCES animal_appointments(appt_id),
    animal_id INTEGER NOT NULL REFERENCES animals(animal_id),
    client_id INTEGER NOT NULL REFERENCES clients(client_id)
);

CREATE TABLE medical_appointments(
    med_appt_id SERIAL PRIMARY KEY,
    appt_id INTEGER NOT NULL REFERENCES animal_appointments(appt_id),
    animal_id INTEGER NOT NULL REFERENCES animals(animal_id),
    client_id INTEGER NOT NULL REFERENCES clients(client_id)
);

CREATE TABLE clients(
    client_id SERIAL PRIMARY KEY,
    name_first VARCHAR(40),
    name_last VARCHAR(40),
    appt_id INTEGER NOT NULL REFERENCES animal_appointments(appt_id)
);