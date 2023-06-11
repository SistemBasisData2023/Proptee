CREATE TABLE users (
user_id serial PRIMARY KEY,
Username varchar(20) UNIQUE NOT NULL,
Password text NOT NULL,
Email text NOT NULL);

CREATE TABLE agent (
agent_id serial PRIMARY KEY,
Username varchar(20) UNIQUE NOT NULL,
Password text NOT NULL,
Email text NOT NULL);

CREATE TABLE properties (
property_id serial PRIMARY KEY,
Nama varchar(20) UNIQUE NOT NULL,
Description varchar(20) NOT NULL,
alamat text UNIQUE NOT NULL,
luas text NOT NULL,
Harga integer NOT NULL,
jumlah_kamar integer NOT NULL,
jumlah_kamar_mandi integer NOT NULL,
agent_id serial NOT NULL,
Status status NOT NULL,
FOREIGN KEY(agent_id) REFERENCES agent(agent_id)
ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE transactions (
transaction_id serial PRIMARY KEY,
user_id serial NOT NULL,
agent_id serial NOT NULL,
property_id serial NOT NULL,
Nama varchar(20) UNIQUE NOT NULL,
tanggal_transaksi date NOT NULL,
Harga integer NOT NULL,
Status status NOT NULL,
FOREIGN KEY(user_id) REFERENCES users(user_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(agent_id) REFERENCES agent(agent_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(property_id) REFERENCES properties(property_id)
ON DELETE CASCADE ON UPDATE CASCADE);

/*-----------------------*/
/*      ROUTE USERS    */
/*-----------------------*/

/*register users*/
INSERT INTO users (username, password, email) VALUES (username, password, email);

/*login users*/
SELECT users_id FROM users WHERE (email, password) = (email, password);

/*buy/rent properties (route users)*/
INSERT INTO transactions (transactions_id, user_id, agent_id, property_id, status);

/* lihat transactions */
SELECT * FROM transactions WHERE users_id = ;

SELECT p.* 
FROM properties p
INNER JOIN agent a ON p.agent_id = a.agent_id
WHERE p.alamat = 'Depok';


/*-----------------------*/
/*      ROUTE AGENT      */
/*-----------------------*/

/*crud agent*/
INSERT INTO users (username, password, email) VALUES (username, password, email);

/*crud properties*/
INSERT INTO properties (Nama) VALUES (Nama);

INSERT INTO properties (nama, description, alamat, luas, harga, jumlah_kamar, jumlah_kamar_mandi, agent_id, status)
VALUES 
    ('Margonda', 'Margonda Residence', 'Jl.Margonda Raya Pondok Cina, 16424, Jawa Barat', '500 m2', 1350, 2, 1, 12324, 'Rented'),
    ('Golf Estate', 'Cimanggis Golf Estate', 'Depok', '164 m2', 1342, 4, 3, 34121, 'Sold'),
    ('Kalibata City', 'Apartment', 'Jl. Kalibata 12, Jakarta Timur', '320 m2', 1000, 3, 2, 12345, 'Available'),
    ('Walkcity 4', 'Residence', 'Jl. Sudirman, Jakarta Selatan', '249 m2', 2000, 4, 3, 67890, 'Available'),
    ('Tamel', 'Apartment', 'Jl. Depok Raya No.56, Depok Baru', '120 m2', 1500, 2, 1, 54321, 'Rented'),
    ('Puri Alamanda', 'Estate', 'Jl. Kukusan Teknik No.43, Depok, Jawa Barat', '321 m2', 1800, 3, 2, 98765, 'Sold');


ALTER TABLE properties DROP column nama;
ALTER TABLE properties ALTER COLUMN property_id TYPE SERIAL;

/* sold/unsold transactions */
UPDATE properties SET status = 'SOLD';
UPDATE properties SET status = 'UNSOLD';