CREATE TABLE IF NOT EXISTS fivemscript_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id VARCHAR(50) NOT NULL,
    value INT NOT NULL,
    UNIQUE KEY unique_player_id (player_id)
);

INSERT INTO fivemscript_data (player_id, value) VALUES ('default', 100);