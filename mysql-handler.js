const mysql = require('mysql');
const { execSync } = require('child_process');

module.exports.pingDatabase = (host, user, password) => {
    let dbcon = mysql.createConnection({
        host: host,
        user: user,
        password: password,
    });
    
    dbcon.ping(err => {
        if (err) throw err;
        console.log("Connected to MySQL.");
        dbcon.end();
    });
};

module.exports.createDatabase = (host, user, password, database_name) => {
    let dbcon = mysql.createConnection({
        host: host,
        user: user,
        password: password,
    });

    dbcon.query("CREATE DATABASE " + database_name, (err, result) => {
        if (err) throw err;
        dbcon.query("ALTER DATABASE " + database_name + " CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci", (err, result) => {
            if (err) throw err;
            console.log("Database created.");
            dbcon.end();
        });
    });
};

module.exports.migrateDatabase = (host, user, password, database) => {
    try {
        execSync("mysql -h " + host + " -u " + user + " --password=" + password + " " + database + " < migration.sql", {stdio: 'ignore'});
        console.log("Database migration successful.");
    }
    catch (err) {
        console.log(err);
    }
};

module.exports.getConnection = (host, user, password, database) => {
    var pool = mysql.createPool({
        host: host,
        user: user,
        password: password,
        database: database
    });

    return pool;
};