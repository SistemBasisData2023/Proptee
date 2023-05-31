const {Client} = require('pg');
const db = new Client({
    user: 'aflahgmc',
    host: 'ep-broad-pine-502933.ap-southeast-1.aws.neon.tech',
    database: 'proptee',
    password: 'uZtHEC7e3yIo',
    port: 5432,
    sslmode: 'require',
    ssl: true
});

db.connect((err) => {
    if (err) {
        console.log(err);
        }
        else {
            console.log('Successfully connected to the database');
        }
});

module.exports = db;