-- drop database if exists social_medium;

-- Create the social_medium database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `social_medium` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- Switch to the social_media database
USE `social_medium`;

-- Create the tag table
CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the profile table
CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the post table
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the post_tag table
CREATE TABLE IF NOT EXISTS `post_tag` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the reaction table
CREATE TABLE IF NOT EXISTS `reaction` (
  `reaction_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `profile_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reaction_id`),
  KEY `post_id` (`post_id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `reaction_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `reaction_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO `tag` (`tag_name`) VALUES
('Technology'),
('Travel'),
('Food'),
('Fashion'),
('Health'),
('Music'),
('Fitness'),
('Books');

INSERT INTO `profile` (`firstname`, `lastname`, `email`, `date_of_birth`, `gender`) VALUES
('Alice', 'Johnson', 'alice@example.com', '1995-03-12', 'Female'),
('Bob', 'Anderson', 'bob@example.com', '1990-07-25', 'Male'),
('Charlie', 'Williams', 'charlie@example.com', '1988-11-18', 'Male'),
('Eva', 'Smith', 'eva@example.com', '1993-05-02', 'Female'),
('David', 'Taylor', 'david@example.com', '1991-09-09', 'Male'),
('Fiona', 'Brown', 'fiona@example.com', '1996-08-22', 'Female'),
('George', 'Davis', 'george@example.com', '1993-04-17', 'Male'),
('Hannah', 'Miller', 'hannah@example.com', '1989-12-05', 'Female'),
('Ian', 'Clark', 'ian@example.com', '1992-10-30', 'Male'),
('Julia', 'Martinez', 'julia@example.com', '1990-06-15', 'Female'),
('Kevin', 'Wilson', 'kevin@example.com', '1994-02-28', 'Male'),
('Linda', 'Moore', 'linda@example.com', '1991-11-20', 'Female'),
('Matt', 'Harris', 'matt@example.com', '1987-07-14', 'Male'),
('Nora', 'Carter', 'nora@example.com', '1995-09-18', 'Female'),
('Oscar', 'Garcia', 'oscar@example.com', '1992-03-08', 'Male'),
('Pamela', 'Lee', 'pamela@example.com', '1988-01-10', 'Female'),
('Quinn', 'Wright', 'quinn@example.com', '1993-12-03', 'Male'),
('Rachel', 'Turner', 'rachel@example.com', '1990-05-27', 'Female'),
('Samuel', 'King', 'samuel@example.com', '1989-08-15', 'Male'),
('Emily', 'Johnson', 'emily@example.com', '1997-08-12', 'Female'),
('Olivia', 'Williams', 'olivia@example.com', '1996-05-25', 'Female'),
('Ava', 'Smith', 'ava@example.com', '1998-11-18', 'Female'),
('Mia', 'Taylor', 'mia@example.com', '1995-09-02', 'Female'),
('Sophia', 'Brown', 'sophia@example.com', '1997-04-09', 'Female'),
('Charlotte', 'Davis', 'charlotte@example.com', '1996-12-17', 'Female'),
('Amelia', 'Miller', 'amelia@example.com', '1998-10-20', 'Female'),
('Harper', 'Clark', 'harper@example.com', '1997-06-15', 'Female'),
('Evelyn', 'Martinez', 'evelyn@example.com', '1995-03-28', 'Female'),
('Abigail', 'Wilson', 'abigail@example.com', '1998-01-11', 'Female'),
('Ella', 'Moore', 'ella@example.com', '1996-07-14', 'Female'),
('Scarlett', 'Harris', 'scarlett@example.com', '1997-09-18', 'Female'),
('Grace', 'Carter', 'grace@example.com', '1995-11-30', 'Female'),
('Chloe', 'Garcia', 'chloe@example.com', '1998-02-04', 'Female'),
('Lily', 'Lee', 'lily@example.com', '1996-12-20', 'Female'),
('Hannah', 'Wright', 'hannah@example.com', '1997-03-03', 'Female'),
('Zoe', 'Turner', 'zoe@example.com', '1995-10-27', 'Female'),
('Victoria', 'King', 'victoria@example.com', '1998-08-15', 'Female'),
('Madison', 'Baker', 'madison@example.com', '1996-06-22', 'Female'),
('Ellie', 'Jackson', 'ellie@example.com', '1997-04-08', 'Female'),
('Liam', 'Johnson', 'liam@example.com', '1997-02-12', 'Male'),
('Noah', 'Williams', 'noah@example.com', '1996-12-25', 'Male'),
('Ethan', 'Smith', 'ethan@example.com', '1998-01-18', 'Male'),
('Lucas', 'Taylor', 'lucas@example.com', '1995-11-02', 'Male'),
('Mason', 'Brown', 'mason@example.com', '1997-04-09', 'Male'),
('Logan', 'Davis', 'logan@example.com', '1996-10-17', 'Male'),
('Oliver', 'Miller', 'oliver@example.com', '1998-08-20', 'Male'),
('Elijah', 'Clark', 'elijah@example.com', '1997-06-15', 'Male'),
('James', 'Martinez', 'james@example.com', '1995-03-28', 'Male'),
('Benjamin', 'Wilson', 'benjamin@example.com', '1998-11-11', 'Male'),
('Tina', 'Baker', 'tina@example.com', '1996-04-22', 'Female');

INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(1, 'Tech Trends', 'Exciting developments in technology!', '2020-01-01 08:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Travel Adventures', 'Exploring new destinations around the world!', '2020-01-02 12:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Foodie Delights', 'Delicious recipes and food discoveries!', '2020-01-03 15:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Fitness Journey', 'Sharing fitness tips and workout routines!', '2020-01-04 17:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'DIY Projects', 'Creative DIY ideas for home improvement!', '2020-01-05 20:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Book Recommendations', 'Must-read books for every bookworm!', '2020-01-06 09:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Health and Wellness', 'Tips for maintaining a healthy lifestyle!', '2020-01-07 11:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Music Playlist', 'Discover new songs and playlists!', '2020-01-08 14:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(9, 'Fashion Trends', 'Latest fashion trends and style inspiration!', '2020-01-09 16:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Gaming Highlights', 'Exciting gaming news and updates!', '2020-01-10 19:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Nature Photography', 'Capturing the beauty of nature through photography!', '2020-01-11 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Financial Tips', 'Smart money management and investment advice!', '2020-01-12 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(13, 'Pet Care Tips', 'Tips for caring for your furry friends!', '2020-01-13 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(14, 'Artistic Creations', 'Exploring creativity through various art forms!', '2020-01-14 16:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Movie Reviews', 'Reviews and recommendations for the latest movies!', '2020-01-15 18:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Home Decor Ideas', 'Inspiring ideas for home decoration!', '2020-01-16 21:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Educational Insights', 'Learning new things and expanding knowledge!', '2020-01-17 09:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Outdoor Adventures', 'Adventures in the great outdoors!', '2020-01-18 12:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Culinary Experiments', 'Exploring new culinary creations!', '2020-01-19 14:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Tech Gadgets', 'Innovative gadgets and technological marvels!', '2020-01-20 17:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(1, 'Healthy Recipes', 'Delicious and nutritious recipes for a healthy lifestyle!', '2020-01-21 09:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Adventure Travel', 'Embarking on thrilling adventures around the globe!', '2020-01-22 12:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Gourmet Dining', 'Indulging in exquisite dining experiences!', '2020-01-23 15:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Fitness Challenges', 'Challenging workouts to push your fitness limits!', '2020-01-24 17:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Creative Crafts', 'Engaging in fun and creative DIY craft projects!', '2020-01-25 20:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Book Reviews', 'Reviews and recommendations for captivating books!', '2020-01-26 08:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Mindfulness Meditation', 'Practicing mindfulness for inner peace and tranquility!', '2020-01-27 11:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Music Festivals', 'Experiencing the excitement of music festivals!', '2020-01-28 13:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(9, 'Fashion Inspiration', 'Inspiring fashion trends and styling tips!', '2020-01-29 16:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Gaming Strategies', 'Strategies and tactics for mastering your favorite games!', '2020-01-30 19:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Nature Escapes', 'Escaping to serene natural landscapes!', '2020-01-31 08:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Financial Planning', 'Planning for a secure financial future!', '2020-01-01 10:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(13, 'Pet Adoption', 'Exploring the joys of pet adoption!', '2020-01-02 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(14, 'Artistic Expression', 'Expressing creativity through various art forms!', '2020-01-03 16:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Movie Night Recommendations', 'Recommendations for the perfect movie night!', '2020-01-04 18:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Interior Design Trends', 'Trends and ideas for interior design!', '2020-01-05 21:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Educational Resources', 'Discovering valuable educational resources!', '2020-01-06 09:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Outdoor Exploration', 'Exploring the beauty of the great outdoors!', '2020-01-07 11:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Culinary Adventures', 'Embarking on culinary adventures around the world!', '2020-01-08 14:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Tech Innovations', 'Exploring the latest technological innovations!', '2020-01-09 17:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(1, 'Tech Innovations', 'Exploring the latest technological innovations!', '2020-01-10 09:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Travel Experiences', 'Sharing memorable travel experiences!', '2020-01-11 12:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Culinary Delights', 'Indulging in mouthwatering culinary delights!', '2020-01-12 15:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Fitness Goals', 'Setting and achieving fitness goals!', '2020-01-13 17:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Creative Projects', 'Engaging in creative and artistic projects!', '2020-01-14 20:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Bookworm Reads', 'Recommendations for avid bookworms!', '2020-01-15 08:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Mindfulness Practices', 'Incorporating mindfulness into daily life!', '2020-01-16 11:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Music Recommendations', 'Discovering new music and artists!', '2020-01-17 13:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(9, 'Fashion Trends', 'Trending fashion styles and trends!', '2020-01-18 16:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Gaming Community', 'Connecting with the gaming community!', '2020-01-19 19:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Outdoor Adventures', 'Embarking on outdoor adventures!', '2020-01-20 08:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Financial Advice', 'Practical financial advice and tips!', '2020-01-21 10:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(13, 'Pet Care Tips', 'Expert tips for pet care and grooming!', '2020-01-22 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(14, 'Artistic Inspirations', 'Inspiration for artistic endeavors!', '2020-01-23 16:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Movie Recommendations', 'Must-watch movies and film recommendations!', '2020-01-24 18:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Home Decor Ideas', 'Ideas for stylish and creative home decor!', '2020-01-25 21:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Educational Insights', 'Insights into various educational topics!', '2020-01-26 09:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Outdoor Exploration', 'Exploring the great outdoors!', '2020-01-27 11:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Culinary Adventures', 'Adventures in culinary exploration!', '2020-01-28 14:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Tech Updates', 'Latest updates in technology and gadgets!', '2020-01-29 17:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(1, 'Healthy Recipes', 'Delicious and healthy recipes for all!', '2020-01-30 09:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Travel Destinations', 'Discovering new travel destinations!', '2020-01-31 12:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Gourmet Cuisine', 'Exploring gourmet cuisine around the world!', '2020-01-01 15:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Fitness Tips', 'Useful tips for achieving fitness goals!', '2020-01-02 17:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'DIY Crafts', 'Fun and creative DIY craft projects!', '2020-01-03 20:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Book Recommendations', 'Recommendations for book lovers!', '2020-01-04 08:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Mindfulness Practices', 'Practicing mindfulness for wellbeing!', '2020-01-05 11:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Music Playlist', 'Creating the perfect music playlist!', '2020-01-06 13:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(9, 'Fashion Trends', 'Trending fashion styles and accessories!', '2020-01-07 16:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Gaming Strategies', 'Effective gaming strategies and tactics!', '2020-01-08 19:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Nature Photography', 'Capturing the beauty of nature!', '2020-01-09 08:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Financial Planning', 'Planning for financial success!', '2020-01-10 10:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(13, 'Pet Adoption', 'Encouraging pet adoption and rescue!', '2020-01-11 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(14, 'Artistic Expression', 'Expressing creativity through art!', '2020-01-12 16:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Movie Reviews', 'Reviews of the latest movies!', '2020-01-13 18:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Interior Design Ideas', 'Ideas for stylish interior design!', '2020-01-14 21:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Educational Resources', 'Valuable resources for learning!', '2020-01-15 09:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Outdoor Adventures', 'Exciting outdoor adventures!', '2020-01-16 11:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Culinary Creations', 'Creating culinary masterpieces!', '2020-01-17 14:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Tech Gadgets', 'Exploring the latest tech gadgets!', '2020-01-18 17:00:00');

INSERT INTO `reaction` (`post_id`, `profile_id`, `created_at`)
VALUES
    (15, 7, '2020-02-05'),
    (25, 12, '2020-02-06'),
    (8, 4, '2020-02-07'),
    (10, 18, '2020-02-08'),
    (3, 9, '2020-02-09'),
    (17, 3, '2020-02-10'),
    (6, 21, '2020-02-11'),
    (29, 5, '2020-02-12'),
    (12, 14, '2020-02-13'),
    (22, 10, '2020-02-14'),
    (5, 2, '2020-02-15'),
    (13, 1, '2020-02-16'),
    (9, 17, '2020-02-17'),
    (18, 19, '2020-02-18'),
    (30, 13, '2020-02-19'),
    (20, 6, '2020-02-20'),
    (7, 22, '2020-02-21'),
    (27, 8, '2020-02-22'),
    (14, 16, '2020-02-23'),
    (23, 11, '2020-02-24'),
    (4, 20, '2020-02-25'),
    (16, 15, '2020-02-26'),
    (28, 23, '2020-02-27'),
    (11, 24, '2020-02-28'),
    (19, 25, '2020-02-29'),
    (1, 26, '2020-03-01'),
    (24, 27, '2020-03-02'),
    (2, 28, '2020-03-03'),
    (26, 29, '2020-03-04'),
    (21, 30, '2020-03-05'),
    (27, 31, '2020-03-06'),
    (8, 32, '2020-03-07'),
    (14, 33, '2020-03-08'),
    (9, 34, '2020-03-09'),
    (22, 35, '2020-03-10'),
    (16, 36, '2020-03-11'),
    (5, 37, '2020-03-12'),
    (18, 38, '2020-03-13'),
    (11, 39, '2020-03-14'),
    (30, 40, '2020-03-15'),
    (7, 41, '2020-03-16'),
    (20, 42, '2020-03-17'),
    (12, 43, '2020-03-18'),
    (29, 44, '2020-03-19'),
    (10, 45, '2020-03-20'),
    (25, 46, '2020-03-21'),
    (3, 47, '2020-03-22'),
    (19, 48, '2020-03-23'),
    (1, 49, '2020-03-24'),
    (17, 50, '2020-03-25'),
    (8, 12, '2020-03-26'),
    (13, 19, '2020-03-27'),
    (26, 23, '2020-03-28'),
    (4, 28, '2020-03-29'),
    (21, 34, '2020-03-30'),
    (17, 37, '2020-03-31'),
    (9, 42, '2020-04-01'),
    (30, 45, '2020-04-02'),
    (6, 48, '2020-04-03'),
    (24, 50, '2020-04-04'),
    (3, 6, '2020-04-05'),
    (18, 14, '2020-04-06'),
    (10, 20, '2020-04-07'),
    (25, 29, '2020-04-08'),
    (16, 35, '2020-04-09'),
    (11, 39, '2020-04-10'),
    (1, 43, '2020-04-11'),
    (27, 47, '2020-04-12'),
    (12, 1, '2020-04-13'),
    (28, 5, '2020-04-14'),
    (5, 10, '2020-04-15'),
    (20, 15, '2020-04-16'),
    (14, 22, '2020-04-17'),
    (29, 30, '2020-04-18'),
    (7, 36, '2020-04-19'),
    (22, 41, '2020-04-20'),
    (19, 46, '2020-04-21'),
    (2, 49, '2020-04-22'),
    (15, 2, '2020-04-23'),
    (23, 7, '2020-04-24'),
    (27, 13, '2020-04-25'),
    (8, 18, '2020-04-26'),
    (13, 24, '2020-04-27'),
    (26, 31, '2020-04-28'),
    (4, 38, '2020-04-29'),
    (21, 44, '2020-04-30'),
    (17, 49, '2020-05-01'),
    (9, 1, '2020-05-02'),
    (30, 5, '2020-05-03'),
    (6, 9, '2020-05-04'),
    (24, 16, '2020-05-05'),
    (3, 21, '2020-05-06'),
    (18, 28, '2020-05-07'),
    (10, 33, '2020-05-08'),
    (25, 39, '2020-05-09'),
    (16, 43, '2020-05-10'),
    (11, 47, '2020-05-11'),
    (1, 50, '2020-05-12'),
    (27, 6, '2020-05-13'),
    (12, 10, '2020-05-14'),
    (28, 15, '2020-05-15'),
    (5, 22, '2020-05-16'),
    (20, 29, '2020-05-17'),
    (14, 35, '2020-05-18'),
    (29, 40, '2020-05-19'),
    (7, 46, '2020-05-20'),
    (22, 50, '2020-05-21'),
    (19, 6, '2020-05-22'),
    (2, 11, '2020-05-23'),
    (15, 17, '2020-05-24'),
    (23, 23, '2020-05-25'),
    (27, 30, '2020-05-26'),
    (8, 36, '2020-05-27'),
    (13, 42, '2020-05-28'),
    (26, 48, '2020-05-29'),
    (4, 2, '2020-05-30'),
    (21, 8, '2020-05-31'),
    (17, 13, '2020-06-01'),
    (9, 19, '2020-06-02'),
    (30, 25, '2020-06-03'),
    (6, 32, '2020-06-04'),
    (24, 37, '2020-06-05'),
    (3, 43, '2020-06-06'),
    (18, 49, '2020-06-07'),
    (10, 5, '2020-06-08'),
    (25, 12, '2020-06-09'),
    (16, 18, '2020-06-10'),
    (11, 24, '2020-06-11'),
    (1, 30, '2020-06-12'),
    (27, 36, '2020-06-13'),
    (12, 42, '2020-06-14'),
    (28, 48, '2020-06-15'),
    (5, 3, '2020-06-16'),
    (20, 9, '2020-06-17'),
    (14, 15, '2020-06-18'),
    (29, 21, '2020-06-19'),
    (7, 27, '2020-06-20'),
    (22, 33, '2020-06-21'),
    (19, 39, '2020-06-22'),
    (2, 45, '2020-06-23'),
    (15, 1, '2020-06-24'),
    (23, 7, '2020-06-25'),
    (27, 14, '2020-06-26'),
    (8, 20, '2020-06-27'),
    (13, 26, '2020-06-28'),
    (26, 32, '2020-06-29'),
    (4, 38, '2020-06-30'),
    (21, 45, '2020-07-01'),
    (17, 2, '2020-07-02'),
    (9, 9, '2020-07-03'),
    (30, 15, '2020-07-04'),
    (6, 21, '2020-07-05'),
    (24, 28, '2020-07-06'),
    (3, 34, '2020-07-07'),
    (18, 40, '2020-07-08'),
    (10, 46, '2020-07-09'),
    (25, 1, '2020-07-10'),
    (16, 7, '2020-07-11'),
    (11, 13, '2020-07-12'),
    (1, 20, '2020-07-13'),
    (27, 26, '2020-07-14'),
    (12, 32, '2020-07-15'),
    (28, 38, '2020-07-16'),
    (5, 44, '2020-07-17'),
    (20, 49, '2020-07-18'),
    (14, 6, '2020-07-19'),
    (29, 12, '2020-07-20'),
    (7, 18, '2020-07-21'),
    (22, 24, '2020-07-22'),
    (19, 30, '2020-07-23'),
    (2, 36, '2020-07-24'),
    (15, 42, '2020-07-25'),
    (23, 48, '2020-07-26'),
    (27, 3, '2020-07-27'),
    (8, 9, '2020-07-28'),
    (13, 15, '2020-07-29'),
    (26, 21, '2020-07-30'),
    (4, 27, '2020-07-31'),
    (21, 33, '2020-08-01'),
    (17, 39, '2020-08-02'),
    (9, 45, '2020-08-03'),
    (30, 2, '2020-08-04'),
    (6, 8, '2020-08-05'),
    (24, 14, '2020-08-06'),
    (3, 20, '2020-08-07'),
    (18, 26, '2020-08-08'),
    (10, 32, '2020-08-09'),
    (25, 38, '2020-08-10'),
    (16, 44, '2020-08-11'),
    (11, 49, '2020-08-12'),
    (1, 6, '2020-08-13'),
    (27, 12, '2020-08-14'),
    (12, 18, '2020-08-15'),
    (28, 24, '2020-08-16'),
    (5, 30, '2020-08-17'),
    (20, 36, '2020-08-18'),
    (14, 42, '2020-08-19'),
    (29, 48, '2020-08-20'),
    (7, 3, '2020-08-21'),
    (22, 9, '2020-08-22'),
    (19, 15, '2020-08-23'),
    (2, 21, '2020-08-24'),
    (15, 27, '2020-08-25'),
    (23, 33, '2020-08-26'),
    (27, 39, '2020-08-27'),
    (8, 45, '2020-08-28'),
    (13, 1, '2020-08-29'),
    (26, 7, '2020-08-30'),
    (4, 13, '2020-08-31'),
    (21, 19, '2020-09-01'),
    (17, 25, '2020-09-02'),
    (9, 31, '2020-09-03'),
    (30, 37, '2020-09-04'),
    (6, 43, '2020-09-05'),
    (24, 49, '2020-09-06'),
    (3, 5, '2020-09-07'),
    (18, 11, '2020-09-08'),
    (10, 17, '2020-09-09'),
    (25, 23, '2020-09-10'),
    (16, 29, '2020-09-11'),
    (11, 35, '2020-09-12'),
    (1, 41, '2020-09-13'),
    (27, 47, '2020-09-14'),
    (12, 2, '2020-09-15'),
    (28, 8, '2020-09-16'),
    (5, 14, '2020-09-17'),
    (20, 20, '2020-09-18'),
    (14, 26, '2020-09-19'),
    (29, 32, '2020-09-20'),
    (7, 38, '2020-09-21'),
    (22, 44, '2020-09-22'),
    (19, 50, '2020-09-23'),
    (2, 6, '2020-09-24'),
    (15, 12, '2020-09-25'),
    (23, 18, '2020-09-26'),
    (27, 24, '2020-09-27'),
    (8, 30, '2020-09-28'),
    (13, 36, '2020-09-29'),
    (26, 42, '2020-09-30'),
    (4, 48, '2020-10-01'),
    (21, 4, '2020-10-02'),
    (17, 10, '2020-10-03'),
    (9, 16, '2020-10-04'),
    (30, 22, '2020-10-05'),
    (6, 28, '2020-10-06'),
    (24, 34, '2020-10-07'),
    (3, 40, '2020-10-08'),
    (18, 46, '2020-10-09'),
    (10, 1, '2020-10-10');

INSERT INTO `post_tag` (`post_id`, `tag_id`)
VALUES
(11, 1),
(11, 2),
(12, 3),
(12, 4),
(13, 1),
(13, 5),
(14, 2),
(14, 3),
(15, 4),
(15, 5),
(16, 1),
(16, 2),
(17, 3),
(17, 4),
(18, 1),
(18, 5),
(19, 2),
(19, 3),
(20, 4),
(20, 5),
(21, 1),
(21, 2),
(22, 3),
(22, 4),
(23, 1),
(23, 5),
(24, 2),
(24, 3),
(25, 4),
(25, 5),
(26, 1),
(26, 2),
(27, 3),
(27, 4),
(28, 1),
(28, 5),
(29, 2),
(29, 3),
(30, 4),
(30, 5),
(31, 1),
(31, 2),
(32, 3),
(32, 4),
(33, 1),
(33, 5),
(34, 2),
(34, 3),
(35, 4),
(35, 5),
(36, 1),
(36, 2),
(37, 3),
(37, 4),
(38, 1),
(38, 5),
(39, 2),
(39, 3),
(40, 4),
(40, 5),
(41, 1),
(41, 2),
(42, 3),
(42, 4),
(43, 1),
(43, 5),
(44, 2),
(44, 3),
(45, 4),
(45, 5),
(46, 1),
(46, 2),
(47, 3),
(47, 4),
(48, 1),
(48, 5),
(49, 2),
(49, 3),
(50, 4),
(50, 5),
(51, 1),
(51, 2),
(52, 3),
(52, 4),
(53, 1),
(53, 5),
(54, 2),
(54, 3),
(55, 4),
(55, 5),
(56, 1),
(56, 2),
(57, 3),
(57, 4),
(58, 1),
(58, 5),
(59, 2),
(59, 3),
(60, 4),
(60, 5),
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(4, 2),
(4, 3),
(5, 4),
(5, 5),
(6, 1),
(6, 2),
(7, 3),
(7, 4),
(8, 1),
(8, 5),
(9, 2),
(9, 3),
(10, 4),
(10, 5);

INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Healthy Recipes', 'Delicious and nutritious meal ideas!', '2020-01-12 10:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(13, 'Fitness Tips', 'Achieve your fitness goals with these tips!', '2020-01-15 14:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(14, 'Travel Adventures', 'Exploring new destinations around the world!', '2020-01-18 16:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'DIY Crafts', 'Get creative with these fun DIY projects!', '2020-01-21 09:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Book Recommendations', 'Discover your next favorite book!', '2020-01-24 11:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Home Decor Ideas', 'Transform your space with these decor ideas!', '2020-01-27 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Movie Reviews', 'Stay updated on the latest movie releases!', '2020-01-30 15:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Fashion Trends', 'Explore the latest fashion trends!', '2020-02-02 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Product Reviews', 'Honest reviews of popular products!', '2020-02-05 10:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Gardening Tips', 'Grow a beautiful garden with these tips!', '2020-02-08 12:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(13, 'Fitness Tips', 'Stay in shape with these helpful fitness tips!', '2020-02-20 09:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(14, 'Self-Care Ideas', 'Take care of yourself with these relaxing self-care ideas.', '2020-03-05 14:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Mindfulness Techniques', 'Learn how to practice mindfulness for a calmer mind.', '2020-04-10 11:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Healthy Snack Ideas', 'Satisfy your cravings with these healthy snack options.', '2020-05-15 08:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Stress Management Tips', 'Manage stress effectively with these helpful tips.', '2020-06-20 16:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Motivational Quotes', 'Find inspiration with these uplifting motivational quotes.', '2020-07-25 13:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Productivity Hacks', 'Boost your productivity with these clever hacks.', '2020-08-30 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Healthy Habits', 'Incorporate these healthy habits into your daily routine.', '2020-10-05 12:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(21, 'Positive Affirmations', 'Start your day with these empowering positive affirmations.', '2020-11-10 15:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(22, 'Relaxation Techniques', 'Unwind and relax with these soothing relaxation techniques.', '2020-12-15 09:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(23, 'Healthy Breakfast Ideas', 'Fuel your day with these nutritious breakfast ideas.', '2021-01-20 11:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(24, 'Mindful Eating Tips', 'Practice mindful eating for a healthier relationship with food.', '2021-02-25 14:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(25, 'Workout Motivation', 'Stay motivated and achieve your fitness goals with these tips.', '2021-04-01 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(26, 'Gratitude Journaling', 'Cultivate gratitude with daily journaling exercises.', '2021-05-06 10:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(27, 'Healthy Dessert Recipes', 'Indulge guilt-free with these delicious and healthy dessert recipes.', '2021-06-11 12:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(28, 'Mindfulness Meditation', 'Practice mindfulness meditation for inner peace and clarity.', '2021-07-16 15:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(29, 'Morning Routine Ideas', 'Start your day off right with these energizing morning routine ideas.', '2021-08-21 09:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(30, 'Positive Thinking Tips', 'Cultivate a positive mindset with these helpful tips.', '2021-09-26 11:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(31, 'Healthy Lunch Ideas', 'Enjoy a delicious and nutritious lunch with these healthy ideas.', '2021-10-31 13:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(32, 'Stress-Relief Activities', 'Relieve stress and unwind with these calming activities.', '2021-12-05 16:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(33, 'Evening Relaxation Routine', 'Wind down and relax before bed with this soothing routine.', '2022-01-10 10:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(34, 'Motivational Podcasts', 'Stay inspired on the go with these motivational podcasts.', '2022-02-14 12:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(35, 'Healthy Dinner Recipes', 'End your day with a delicious and healthy dinner using these recipes.', '2022-03-21 15:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(36, 'Digital Detox Tips', 'Unplug and recharge with these tips for a digital detox.', '2022-04-25 08:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(37, 'Positive Visualization Exercises', 'Visualize your dreams and goals with these powerful exercises.', '2022-05-30 11:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(38, 'Hydration Tips', 'Stay hydrated and healthy with these hydration tips.', '2022-07-04 13:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(39, 'Mindful Walking', 'Connect with nature and practice mindfulness with mindful walking.', '2022-08-09 16:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(40, 'Healthy Snack Recipes', 'Satisfy your cravings with these easy and nutritious snack recipes.', '2022-09-13 09:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(1, 'Daily Gratitude Practice', 'Cultivate gratitude and appreciation with a daily practice.', '2022-10-18 12:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Morning Meditation Routine', 'Start your day with clarity and focus with this morning meditation routine.', '2022-11-22 15:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Positive Affirmation Cards', 'Boost your mood and confidence with these positive affirmation cards.', '2022-12-27 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Smoothie Recipes', 'Fuel your day with these delicious and nutritious smoothie recipes.', '2027-01-31 11:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Digital Wellness Tips', 'Maintain a healthy balance with technology using these digital wellness tips.', '2027-03-07 13:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Mindful Breathing Exercises', 'Relieve stress and anxiety with these simple mindful breathing exercises.', '2027-04-11 16:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Gratitude Journal Prompts', 'Reflect on your blessings with these gratitude journal prompts.', '2027-05-16 09:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Healthy Meal Prep Tips', 'Save time and eat healthy with these meal prep tips.', '2027-06-20 12:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(9, 'Evening Self-Care Routine', 'Wind down and pamper yourself with this relaxing evening self-care routine.', '2027-07-25 14:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Positive Playlist', 'Boost your mood and energy with this uplifting and positive playlist.', '2027-08-29 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Positive Playlist', 'Boost your mood and energy with this uplifting and positive playlist.', '2023-08-29 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Hydration Habits', 'Stay hydrated throughout the day with these healthy hydration habits.', '2023-10-03 10:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Gratitude Meditation', 'Cultivate gratitude and peace with this guided meditation.', '2023-11-07 13:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Habits Tracker', 'Track your progress and stay accountable with this healthy habits tracker.', '2023-12-12 15:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Morning Stretch Routine', 'Wake up your body and mind with this energizing morning stretch routine.', '2020-01-16 08:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Snacking Tips', 'Make smart snack choices with these helpful tips for healthy snacking.', '2020-02-20 11:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Mindful Eating Journal', 'Practice mindful eating and develop a healthier relationship with food with this journal.', '2020-03-25 14:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Self-Talk', 'Boost your self-esteem and confidence with positive self-talk.', '2020-04-29 16:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Gratitude Jar', 'Create a gratitude jar and fill it with daily moments of gratitude.', '2020-06-03 09:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(9, 'Healthy Dessert Alternatives', 'Satisfy your sweet tooth with these guilt-free healthy dessert alternatives.', '2020-07-08 11:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Evening Reflection Routine', 'Reflect on your day and practice gratitude with this evening reflection routine.', '2020-08-12 14:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Mindful Breathing App', 'Use a mindful breathing app to help you relax and reduce stress.', '2020-09-16 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Positive Visualization Techniques', 'Harness the power of positive visualization to achieve your goals.', '2020-10-21 11:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Healthy Cooking Classes', 'Join healthy cooking classes to learn new recipes and cooking techniques.', '2020-11-25 13:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Office Snacks', 'Stock up on healthy snacks to keep you energized throughout the workday.', '2021-02-05 09:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Mindful Eating Workshop', 'Attend a mindful eating workshop to learn mindful eating techniques.', '2021-03-12 12:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Daily Affirmation Wall', 'Create a daily affirmation wall to inspire and motivate you every day.', '2021-04-16 15:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Morning Yoga Routine', 'Start your day with a refreshing morning yoga routine to invigorate your body and mind.', '2021-05-21 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Healthy Cooking Challenge', 'Take on a healthy cooking challenge and try new recipes each week.', '2021-06-25 10:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Digital Detox Retreat', 'Disconnect and recharge with a digital detox retreat in nature.', '2021-07-30 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Healthy Lifestyle Journal', 'Keep track of your fitness journey and healthy habits with a lifestyle journal.', '2021-09-03 16:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Gratitude Tree', 'Create a gratitude tree and add leaves with things you are grateful for each day.', '2021-10-08 09:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(14, 'Healthy Meal Planning', 'Plan your meals ahead of time for a week of healthy and balanced eating.', '2021-11-12 11:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(14, 'Mindful Walking Meditation', 'Practice mindfulness while walking and connect with nature.', '2021-12-17 14:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Positive Affirmation Mirror', 'Write positive affirmations on your mirror to boost self-confidence.', '2022-01-21 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Healthy Lifestyle Podcasts', 'Listen to podcasts on healthy living for inspiration and tips.', '2022-02-25 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Gratitude Photo Album', 'Create a photo album of things you are grateful for and look at it regularly.', '2022-04-01 12:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Healthy Office Environment', 'Create a healthy office environment with plants and natural light.', '2022-05-06 15:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Evening Gratitude Ritual', 'End your day with a gratitude ritual to reflect on the positives.', '2022-06-10 08:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Healthy Cooking Blogs', 'Follow blogs with healthy recipes and cooking tips for inspiration.', '2022-07-15 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Mindful Eating Challenge', 'Take on a mindful eating challenge and savor every bite of your meals.', '2023-08-19 13:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Positive Mantras', 'Repeat positive mantras throughout the day to shift your mindset.', '2023-09-23 15:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Morning Meditation App', 'Start your day with a guided meditation using a meditation app.', '2023-10-28 08:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Recipe Swap', 'Swap unhealthy recipes with friends for healthier alternatives.', '2023-12-02 11:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Digital Detox Challenge', 'Challenge yourself to a weekend digital detox for mental clarity.', '2020-01-06 13:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Gratitude Jar', 'Fill a jar with notes of gratitude and read them when you need a boost.', '2020-02-10 15:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Healthy Habit Tracker App', 'Use an app to track your progress and stay accountable to your healthy habits.', '2020-03-17 08:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(9, 'Positive Affirmation Journal', 'Write down positive affirmations in a journal and read them daily.', '2020-04-21 10:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(8, 'Mindful Breathing Timer', 'Set a timer for mindful breathing exercises throughout the day.', '2020-05-26 13:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(9, 'Healthy Recipe Challenge', 'Challenge yourself to try a new healthy recipe every week.', '2020-06-30 15:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(1, 'Gratitude Walk', 'Take a walk and focus on things you are grateful for in your life.', '2020-08-04 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Healthy Living Blogs', 'Read blogs on healthy living for tips, recipes, and motivation.', '2020-09-08 11:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(1, 'Positive Affirmation Cards', 'Create your own positive affirmation cards and carry them with you for inspiration.', '2020-10-13 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Morning Gratitude Practice', 'Start your day by listing three things you are grateful for.', '2020-11-17 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Cooking Classes', 'Take cooking classes to learn new healthy recipes and cooking techniques.', '2020-12-22 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Mindful Eating Workshop', 'Attend a workshop on mindful eating to learn how to savor your meals.', '2021-01-26 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Visualization Exercise', 'Visualize yourself achieving your goals and feeling happy and fulfilled.', '2021-03-01 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Gratitude Journal', 'Keep a gratitude journal and write down three things you are grateful for every day.', '2021-04-05 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(9, 'Healthy Recipe Book', 'Create a recipe book filled with your favorite healthy recipes.', '2021-05-10 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Digital Detox Retreat', 'Plan a weekend getaway where you can disconnect from technology and reconnect with nature.', '2021-06-14 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Positive Affirmation Mirror', 'Write positive affirmations on your mirror to boost self-confidence.', '2023-01-21 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Healthy Lifestyle Podcasts', 'Listen to podcasts on healthy living for inspiration and tips.', '2023-02-25 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Gratitude Photo Album', 'Create a photo album of things you are grateful for and look at it regularly.', '2023-04-01 12:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Healthy Office Environment', 'Create a healthy office environment with plants and natural light.', '2023-05-06 15:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Evening Gratitude Ritual', 'End your day with a gratitude ritual to reflect on the positives.', '2023-06-10 08:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Cooking Blogs', 'Follow blogs with healthy recipes and cooking tips for inspiration.', '2023-07-15 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Mindful Eating Challenge', 'Take on a mindful eating challenge and savor every bite of your meals.', '2023-08-19 13:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Mantras', 'Repeat positive mantras throughout the day to shift your mindset.', '2023-09-23 15:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Morning Meditation App', 'Start your day with a guided meditation using a meditation app.', '2023-10-28 08:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Recipe Swap', 'Swap unhealthy recipes with friends for healthier alternatives.', '2023-12-02 11:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Digital Detox Challenge', 'Challenge yourself to a weekend digital detox for mental clarity.', '2020-01-06 13:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Gratitude Jar', 'Fill a jar with notes of gratitude and read them when you need a boost.', '2020-02-10 15:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Healthy Habit Tracker App', 'Use an app to track your progress and stay accountable to your healthy habits.', '2020-03-17 08:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Positive Affirmation Journal', 'Write down positive affirmations in a journal and read them daily.', '2020-04-21 10:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Mindful Breathing Timer', 'Set a timer for mindful breathing exercises throughout the day.', '2020-05-26 13:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Recipe Challenge', 'Challenge yourself to try a new healthy recipe every week.', '2020-06-30 15:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Gratitude Walk', 'Take a walk and focus on things you are grateful for in your life.', '2020-08-04 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Healthy Living Blogs', 'Read blogs on healthy living for tips, recipes, and motivation.', '2020-09-08 11:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Positive Affirmation Cards', 'Create your own positive affirmation cards and carry them with you for inspiration.', '2020-10-13 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Morning Gratitude Practice', 'Start your day by listing three things you are grateful for.', '2020-11-17 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Cooking Classes', 'Take cooking classes to learn new healthy recipes and cooking techniques.', '2020-12-22 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Mindful Eating Workshop', 'Attend a workshop on mindful eating to learn how to savor your meals.', '2021-01-26 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Visualization Exercise', 'Visualize yourself achieving your goals and feeling happy and fulfilled.', '2021-03-01 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Gratitude Journal', 'Keep a gratitude journal and write down three things you are grateful for every day.', '2021-04-05 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Recipe Book', 'Create a recipe book filled with your favorite healthy recipes.', '2021-05-10 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Digital Detox Retreat', 'Plan a weekend getaway where you can disconnect from technology and reconnect with nature.', '2021-06-14 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Morning Meditation Routine', 'Start your day with a meditation routine to set a positive tone for the day.', '2022-07-19 12:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Healthy Habit Tracker', 'Use a habit tracker to monitor your progress and stay on track with your goals.', '2022-08-23 15:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Positive Affirmation Board', 'Create a vision board with positive affirmations and images that inspire you.', '2022-09-27 08:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Mindful Breathing Exercise', 'Practice mindful breathing exercises to reduce stress and increase focus.', '2022-11-01 11:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Healthy Cooking Challenge', 'Challenge yourself to cook a healthy meal from scratch at least once a week.', '2023-12-06 13:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Gratitude Practice', 'Take a moment each day to reflect on the things you are grateful for.', '2023-01-10 15:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Healthy Living Podcasts', 'Listen to podcasts on healthy living for inspiration and motivation.', '2023-02-14 08:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Positive Affirmation Journal', 'Write down positive affirmations in a journal and read them aloud each morning.', '2023-03-20 10:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Morning Gratitude Ritual', 'Start your day with a gratitude ritual by listing things you are grateful for.', '2023-04-24 13:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Cooking Classes', 'Take cooking classes to learn new healthy recipes and cooking techniques.', '2023-05-29 15:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Mindful Eating Workshop', 'Attend a workshop on mindful eating to learn how to savor your meals.', '2023-07-03 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Visualization Exercise', 'Visualize yourself achieving your goals and feeling happy and fulfilled.', '2023-08-07 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Gratitude Journal', 'Keep a gratitude journal and write down three things you are grateful for every day.', '2023-09-11 12:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Recipe Book', 'Create a recipe book filled with your favorite healthy recipes.', '2023-10-16 15:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Digital Detox Retreat', 'Plan a weekend getaway where you can disconnect from technology and reconnect with nature.', '2020-11-20 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Morning Meditation Routine', 'Start your day with a meditation routine to set a positive tone for the day.', '2020-12-25 11:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Healthy Habit Tracker', 'Use a habit tracker to monitor your progress and stay on track with your goals.', '2021-01-29 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Positive Affirmation Board', 'Create a vision board with positive affirmations and images that inspire you.', '2021-03-05 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Mindful Breathing Exercise', 'Practice mindful breathing exercises to reduce stress and increase focus.', '2021-04-09 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Cooking Challenge', 'Challenge yourself to cook a healthy meal from scratch at least once a week.', '2021-05-14 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Gratitude Practice', 'Take a moment each day to reflect on the things you are grateful for.', '2021-06-18 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Healthy Living Podcasts', 'Listen to podcasts on healthy living for inspiration and motivation.', '2021-07-23 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Positive Affirmation Journal', 'Write down positive affirmations in a journal and read them aloud each morning.', '2021-08-27 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Morning Gratitude Ritual', 'Start your day with a gratitude ritual by listing things you are grateful for.', '2021-09-30 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Cooking Classes', 'Take cooking classes to learn new healthy recipes and cooking techniques.', '2021-11-04 12:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Mindful Eating Workshop', 'Attend a workshop on mindful eating to learn how to savor your meals.', '2021-12-09 15:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Visualization Exercise', 'Visualize yourself achieving your goals and feeling happy and fulfilled.', '2022-01-13 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Gratitude Journal', 'Keep a gratitude journal and write down three things you are grateful for every day.', '2022-02-17 11:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Recipe Book', 'Create a recipe book filled with your favorite healthy recipes.', '2022-03-24 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Digital Detox Retreat', 'Plan a weekend getaway where you can disconnect from technology and reconnect with nature.', '2022-04-28 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Morning Meditation Routine', 'Start your day with a meditation routine to set a positive tone for the day.', '2022-06-02 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Healthy Habit Tracker', 'Use a habit tracker to monitor your progress and stay on track with your goals.', '2022-07-07 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Positive Affirmation Board', 'Create a vision board with positive affirmations and images that inspire you.', '2022-08-11 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Mindful Breathing Exercise', 'Practice mindful breathing exercises to reduce stress and increase focus.', '2022-09-15 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Mindful Breathing Exercise', 'Practice mindful breathing exercises to reduce stress and increase focus.', '2023-09-15 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Cooking Challenge', 'Challenge yourself to cook a healthy meal from scratch at least once a week.', '2023-10-20 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Gratitude Practice', 'Take a moment each day to reflect on the things you are grateful for.', '2023-11-24 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Healthy Living Podcasts', 'Listen to podcasts on healthy living for inspiration and motivation.', '2023-12-29 12:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Positive Affirmation Journal', 'Write down positive affirmations in a journal and read them aloud each morning.', '2020-02-02 15:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Morning Gratitude Ritual', 'Start your day with a gratitude ritual by listing things you are grateful for.', '2020-03-07 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Cooking Classes', 'Take cooking classes to learn new healthy recipes and cooking techniques.', '2020-04-11 11:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Mindful Eating Workshop', 'Attend a workshop on mindful eating to learn how to savor your meals.', '2020-05-16 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Visualization Exercise', 'Visualize yourself achieving your goals and feeling happy and fulfilled.', '2020-06-20 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Gratitude Journal', 'Keep a gratitude journal and write down three things you are grateful for every day.', '2020-07-25 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Recipe Book', 'Create a recipe book filled with your favorite healthy recipes.', '2020-08-29 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Digital Detox Retreat', 'Plan a weekend getaway where you can disconnect from technology and reconnect with nature.', '2020-10-03 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Morning Meditation Routine', 'Start your day with a meditation routine to set a positive tone for the day.', '2020-11-07 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Healthy Habit Tracker', 'Use a habit tracker to monitor your progress and stay on track with your goals.', '2020-12-12 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Positive Affirmation Board', 'Create a vision board with positive affirmations and images that inspire you.', '2021-01-16 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Mindful Breathing Exercise', 'Practice mindful breathing exercises to reduce stress and increase focus.', '2021-02-20 12:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Cooking Challenge', 'Challenge yourself to cook a healthy meal from scratch at least once a week.', '2021-03-27 15:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Gratitude Practice', 'Take a moment each day to reflect on the things you are grateful for.', '2021-04-30 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Healthy Living Podcasts', 'Listen to podcasts on healthy living for inspiration and motivation.', '2021-06-04 11:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Positive Affirmation Journal', 'Write down positive affirmations in a journal and read them aloud each morning.', '2021-07-09 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Morning Gratitude Ritual', 'Start your day with a gratitude ritual by listing things you are grateful for.', '2021-08-13 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Cooking Classes', 'Take cooking classes to learn new healthy recipes and cooking techniques.', '2021-09-17 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Mindful Eating Workshop', 'Attend a workshop on mindful eating to learn how to savor your meals.', '2021-10-22 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Visualization Exercise', 'Visualize yourself achieving your goals and feeling happy and fulfilled.', '2021-11-26 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Gratitude Journal', 'Keep a gratitude journal and write down three things you are grateful for every day.', '2021-12-31 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Recipe Book', 'Create a recipe book filled with your favorite healthy recipes.', '2022-02-04 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Digital Detox Retreat', 'Plan a weekend getaway where you can disconnect from technology and reconnect with nature.', '2022-03-11 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Morning Meditation Routine', 'Start your day with a meditation routine to set a positive tone for the day.', '2022-04-15 12:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Healthy Habit Tracker', 'Use a habit tracker to monitor your progress and stay on track with your goals.', '2022-05-20 15:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Positive Affirmation Board', 'Create a vision board with positive affirmations and images that inspire you.', '2022-06-24 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Mindful Breathing Exercise', 'Practice mindful breathing exercises to reduce stress and increase focus.', '2023-07-29 11:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Cooking Challenge', 'Challenge yourself to cook a healthy meal from scratch at least once a week.', '2023-09-02 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Gratitude Practice', 'Take a moment each day to reflect on the things you are grateful for.', '2023-10-07 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Healthy Living Podcasts', 'Listen to podcasts on healthy living for inspiration and motivation.', '2023-11-11 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Positive Affirmation Journal', 'Write down positive affirmations in a journal and read them aloud each morning.', '2023-12-16 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Morning Gratitude Ritual', 'Start your day with a gratitude ritual by listing things you are grateful for.', '2020-01-20 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Cooking Classes', 'Take cooking classes to learn new healthy recipes and cooking techniques.', '2020-02-24 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Mindful Eating Workshop', 'Attend a workshop on mindful eating to learn how to savor your meals.', '2020-03-31 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Visualization Exercise', 'Visualize yourself achieving your goals and feeling happy and fulfilled.', '2020-05-05 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Gratitude Journal', 'Keep a gratitude journal and write down three things you are grateful for every day.', '2020-06-09 12:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Recipe Book', 'Create a recipe book filled with your favorite healthy recipes.', '2020-07-14 15:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Digital Detox Retreat', 'Plan a weekend getaway where you can disconnect from technology and reconnect with nature.', '2020-08-18 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Morning Meditation Routine', 'Start your day with a meditation routine to set a positive tone for the day.', '2020-09-22 11:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Healthy Habit Tracker', 'Use a habit tracker to monitor your progress and stay on track with your goals.', '2020-10-27 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Positive Affirmation Board', 'Create a vision board with positive affirmations and images that inspire you.', '2020-12-01 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(17, 'Mindful Breathing Exercise', 'Practice mindful breathing exercises to reduce stress and increase focus.', '2021-01-05 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(5, 'Healthy Cooking Challenge', 'Challenge yourself to cook a healthy meal from scratch at least once a week.', '2021-02-09 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Gratitude Practice', 'Take a moment each day to reflect on the things you are grateful for.', '2021-03-15 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(2, 'Healthy Living Podcasts', 'Listen to podcasts on healthy living for inspiration and motivation.', '2021-04-19 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(10, 'Positive Affirmation Journal', 'Write down positive affirmations in a journal and read them aloud each morning.', '2021-05-24 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Morning Gratitude Ritual', 'Start your day with a gratitude ritual by listing things you are grateful for.', '2021-06-28 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Cooking Classes', 'Take cooking classes to learn new healthy recipes and cooking techniques.', '2021-08-02 12:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(15, 'Mindful Eating Workshop', 'Attend a workshop on mindful eating to learn how to savor your meals.', '2021-09-06 15:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(7, 'Positive Visualization Exercise', 'Visualize yourself achieving your goals and feeling happy and fulfilled.', '2021-10-11 08:40:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(19, 'Gratitude Journal', 'Keep a gratitude journal and write down three things you are grateful for every day.', '2021-11-15 11:05:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Recipe Book', 'Create a recipe book filled with your favorite healthy recipes.', '2021-12-20 13:30:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(12, 'Digital Detox Retreat', 'Plan a weekend getaway where you can disconnect from technology and reconnect with nature.', '2022-01-24 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(3, 'Morning Meditation Routine', 'Start your day with a meditation routine to set a positive tone for the day.', '2022-02-28 08:20:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(18, 'Healthy Habit Tracker', 'Use a habit tracker to monitor your progress and stay on track with your goals.', '2022-04-04 10:45:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(11, 'Positive Affirmation Board', 'Create a vision board with positive affirmations and images that inspire you.', '2022-05-09 13:10:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(26, 'Mindful Breathing Exercise', 'Practice mindful breathing exercises to reduce stress and increase focus.', '2023-06-13 15:35:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(6, 'Healthy Cooking Challenge', 'Challenge yourself to cook a healthy meal from scratch at least once a week.', '2023-07-18 08:00:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(36, 'Gratitude Practice', 'Take a moment each day to reflect on the things you are grateful for.', '2023-08-22 10:25:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(16, 'Healthy Living Podcasts', 'Listen to podcasts on healthy living for inspiration and motivation.', '2023-09-26 12:50:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(32, 'Positive Affirmation Journal', 'Write down positive affirmations in a journal and read them aloud each morning.', '2023-10-31 15:15:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(20, 'Morning Gratitude Ritual', 'Start your day with a gratitude ritual by listing things you are grateful for.', '2020-12-05 15:55:00');
INSERT INTO `post` (`profile_id`, `title`, `content`, `created_at`) VALUES
(4, 'Healthy Cooking Classes', 'Take cooking classes to learn new healthy recipes and cooking techniques.', '2020-01-09 08:20:00');
