-- CreateTable
CREATE TABLE `author` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `author_name` VARCHAR(100) NOT NULL,
    `nick_name` VARCHAR(191) NULL,
    `del_flg` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `author_author_name_key`(`author_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `albums` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `songs_name` VARCHAR(100) NOT NULL,
    `description` VARCHAR(191) NULL,
    `authorId` INTEGER NOT NULL,
    `del_flg` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `albums_songs_name_key`(`songs_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `songs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `songs_name` VARCHAR(100) NOT NULL,
    `description` VARCHAR(191) NULL,
    `authorId` INTEGER NOT NULL,
    `del_flg` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `songs_songs_name_key`(`songs_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `albums` ADD CONSTRAINT `albums_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `author`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `songs` ADD CONSTRAINT `songs_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `albums`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
