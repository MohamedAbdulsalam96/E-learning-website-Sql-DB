

CREATE DATABASE mohammed_alqadasi;
use mohammed_alqadasi;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/m5HC6p
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `account` (
    `id` int(11)  NOT NULL ,
    `first_name` varchar(255)  NOT NULL ,
    `last_name` varchar(255)  NOT NULL ,
    `user_name` varchar(255)  NOT NULL ,
    `email` varchar(255)  NOT NULL ,
    `phone` int(15)  NOT NULL ,
    `password` varchar(255)  NOT NULL ,
    `gender` varchar(255)  NOT NULL ,
    `birthdate` date  NOT NULL ,
    `is_active` int(11)  NOT NULL ,
    `created_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `courses_id` int(11)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `courses` (
    `id` int(11)  NOT NULL ,
    `course_name` varchar(255)  NOT NULL ,
    `image` varchar(255)  NOT NULL ,
    `type` varchar(255)  NOT NULL ,
    `subject_id` int(11)  NOT NULL ,
    `subjects_id` int(11)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `subjects` (
    `id` int(11)  NOT NULL ,
    `subject_name` varchar(255)  NOT NULL ,
    `status` tinyint(1)  NOT NULL ,
    `created_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `unit_id` int(11)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `units` (
    `id` int(11)  NOT NULL ,
    `unit_name` varchar(255)  NOT NULL ,
    `video` varchar(255)  NOT NULL ,
    `short_disc` text  NOT NULL ,
    `created_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `test_id` int(11)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `tests` (
    `id` int(11)  NOT NULL ,
    `title` varchar(255)  NOT NULL ,
    `score` int(255)  NOT NULL ,
    `created_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `question_id` int(11)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `question` (
    `id` int(11)  NOT NULL ,
    `question_title` varchar(255)  NOT NULL ,
    `created_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `answers` (
    `id` int(11)  NOT NULL ,
    `answer` varchar(255)  NOT NULL ,
    `is_correct` varchar(255)  NOT NULL ,
    `created_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `question_id` int(11)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `student_answer` (
    `s_a_id` int(11)  NOT NULL ,
    `score` int(255)  NOT NULL ,
    `created_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `account_id` int(11)  NOT NULL ,
    `answer_id` int(11)  NOT NULL ,
    `question_id` int(11)  NOT NULL ,
    PRIMARY KEY (
        `s_a_id`
    )
);

CREATE TABLE `student_test` (
    `id` int(11)  NOT NULL ,
    `account_id` int(11)  NOT NULL ,
    `test_id` int(11)  NOT NULL ,
    `accountid` int(11)  NOT NULL ,
    `courses_id` int(11)  NOT NULL ,
    `created_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp  NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (
        `id`
    )
);

ALTER TABLE `account` ADD CONSTRAINT `fk_account_courses_id` FOREIGN KEY(`courses_id`)
REFERENCES `courses` (`id`);

ALTER TABLE `courses` ADD CONSTRAINT `fk_courses_subjects_id` FOREIGN KEY(`subjects_id`)
REFERENCES `subjects` (`id`);

ALTER TABLE `subjects` ADD CONSTRAINT `fk_subjects_unit_id` FOREIGN KEY(`unit_id`)
REFERENCES `units` (`id`);

ALTER TABLE `units` ADD CONSTRAINT `fk_units_test_id` FOREIGN KEY(`test_id`)
REFERENCES `tests` (`id`);

ALTER TABLE `tests` ADD CONSTRAINT `fk_tests_question_id` FOREIGN KEY(`question_id`)
REFERENCES `question` (`id`);

ALTER TABLE `answers` ADD CONSTRAINT `fk_answers_question_id` FOREIGN KEY(`question_id`)
REFERENCES `question` (`id`);

ALTER TABLE `student_answer` ADD CONSTRAINT `fk_student_answer_account_id` FOREIGN KEY(`account_id`)
REFERENCES `account` (`id`);

ALTER TABLE `student_answer` ADD CONSTRAINT `fk_student_answer_answer_id` FOREIGN KEY(`answer_id`)
REFERENCES `answers` (`id`);

ALTER TABLE `student_answer` ADD CONSTRAINT `fk_student_answer_question_id` FOREIGN KEY(`question_id`)
REFERENCES `question` (`id`);

ALTER TABLE `student_test` ADD CONSTRAINT `fk_student_test_test_id` FOREIGN KEY(`test_id`)
REFERENCES `tests` (`id`);

ALTER TABLE `student_test` ADD CONSTRAINT `fk_student_test_accountid` FOREIGN KEY(`accountid`)
REFERENCES `account` (`id`);

ALTER TABLE `student_test` ADD CONSTRAINT `fk_student_test_courses_id` FOREIGN KEY(`courses_id`)
REFERENCES `courses` (`id`);


