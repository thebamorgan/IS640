CREATE TABLE customers (
    customer_id VARCHAR(32) NOT NULL,
    customer_unique_id VARCHAR(32) NOT NULL,
    customer_zip_code_prefix CHAR(5) NOT NULL,
    customer_city VARCHAR(100) NOT NULL,
    customer_state CHAR(2) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE sellers (
    seller_id VARCHAR(32) NOT NULL,
    seller_zip_code_prefix CHAR(5) NOT NULL,
    seller_city VARCHAR(100) NOT NULL,
    seller_state CHAR(2) NOT NULL,
    PRIMARY KEY (seller_id)
);

CREATE TABLE products (
    product_id VARCHAR(32) NOT NULL,
    product_category_name VARCHAR(100) NULL,
    product_name_lenght INT NULL,
    product_description_lenght INT NULL,
    product_photos_qty INT NULL,
    product_weight_g INT NULL,
    product_length_cm INT NULL,
    product_height_cm INT NULL,
    product_width_cm INT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE orders (
    order_id VARCHAR(32) NOT NULL,
    customer_id VARCHAR(32) NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    order_purchase_timestamp DATETIME NOT NULL,
    order_approved_at DATETIME NULL,
    order_delivered_carrier_date DATETIME NULL,
    order_delivered_customer_date DATETIME NULL,
    order_estimated_delivery_date DATETIME NOT NULL,
    PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE order_items (
    order_id VARCHAR(32) NOT NULL,
    order_item_id INT NOT NULL,
    product_id VARCHAR(32) NOT NULL,
    seller_id VARCHAR(32) NOT NULL,
    shipping_limit_date DATETIME NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    freight_value DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, order_item_id),
    CONSTRAINT fk_items_order
        FOREIGN KEY (order_id) REFERENCES orders (order_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_items_product
        FOREIGN KEY (product_id) REFERENCES products (product_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_items_seller
        FOREIGN KEY (seller_id) REFERENCES sellers (seller_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);


-- ============================================================================
-- 1. CUSTOMERS (27 rows)
-- ============================================================================
INSERT INTO customers (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state) VALUES
    ('07193e2fc8e6b8a63e6c080a3cff4d89', 'ac1ce9b3fc0bbdc4d72c814871b23c35', '36088', 'juiz de fora', 'MG'),
    ('1632dff93175c88a137a7aa512194dce', 'aa31d3c17fe24c531e562d9fe2fe711e', '13283', 'vinhedo', 'SP'),
    ('21128c7bab1ce9de02ecd04bee493880', 'ad39a565c2c4b1aeee3fb7a96e8ed4e8', '45605', 'itabuna', 'BA'),
    ('227479d882d32260a182a621faeb2bc3', 'bc5a9f98885f5ed8951c81623a2f9d83', '22241', 'rio de janeiro', 'RJ'),
    ('3e6ee83b129d8611fe4e39d47b18d8c6', '1c8d56713e12f99df6c515b231ba4781', '29176', 'serra', 'ES'),
    ('5b21f3f793e9f6c8211c80e123d3f434', 'c1c8e96cdddf350b61600f9a1717a87e', '13100', 'campinas', 'SP'),
    ('6750172272a6a616067b595a9aa0d6c2', 'c0feca9e5d043fc29634ffe766756f11', '78890', 'sorriso', 'MT'),
    ('69eb26a67cff49ff2040a3817602061c', 'd975a54519948041a4365850cb594836', '79130', 'rio brilhante', 'MS'),
    ('79b4e6917237551454e77c23285fa09a', '825fcac393acc9ddfc4fc658d565ebfe', '16207', 'birigui', 'SP'),
    ('8016d8085d0ac1f2b9f92022d07f1ee8', '26e427a3210be34f8aa07c3966983ea5', '90420', 'porto alegre', 'RS'),
    ('81391dccf0ddecf22324b3ed34008079', 'b12280090e7728296f697791c978d775', '13486', 'limeira', 'SP'),
    ('8aa26613f99b460c27155238fd55ec7e', '6402d1b2927387b210f6360a1933d931', '25655', 'petropolis', 'RJ'),
    ('8ac12be4103f6d1ad36d0c21efc8fd5f', 'fa58e11c149d7e903dbe5f6c854277e7', '98780', 'santa rosa', 'RS'),
    ('8c28edb50beda68d7be316b7bfd1fcac', 'adcb53ce159169111fb696e5afb4e95f', '59490', 'ielmo marinho', 'RN'),
    ('8cd2b07859256908ad3bf9ae3d9ef119', '139e9b262197482cdb63564b4c8ef115', '04201', 'sao paulo', 'SP'),
    ('9f57e674f66d1758920393d010d9e969', '1680c593cfe1d6c798df5bd696544a19', '38304', 'ituiutaba', 'MG'),
    ('a5adb81886eb68c76f621cb69a2eb9f6', 'cb9f1b479c24cdcbd80d7c7064e4c9fd', '27521', 'resende', 'RJ'),
    ('ab23995b2f7c718cd8c3b812ffd4d2e5', 'e90c83ac8c8dc897f5c2d7b7fa0c58bc', '36071', 'juiz de fora', 'MG'),
    ('b148e229c3c9f7260f706caf5ff17d23', '0645628d52f5d19300ea0a33accdf4f4', '09715', 'sao bernardo do campo', 'SP'),
    ('ba918f303c01fdb6620798b7d144d9ba', 'b7513835424c762e8b97207891c0f897', '18611', 'botucatu', 'SP'),
    ('cd717f4d257d83f8fc1444f73167b8d6', '32ec4cc78ff1333feca4aa96ef95bb74', '35450', 'itabirito', 'MG'),
    ('d8c88eafe65e8e7210a84872fd488edd', '22b04aabcbf2a01fd2c923338c560559', '22240', 'rio de janeiro', 'RJ'),
    ('e8d994960222368ac5e42a9109cffb19', '94c767a092f2b908571e91c6ab558b4c', '21040', 'rio de janeiro', 'RJ'),
    ('ed078a8771e5fe1d9b99bff595938736', 'a24f17b8ba95624b0301d85ab9c897a9', '13844', 'mogi-guacu', 'SP'),
    ('ed3456724c3939113ed2747629e87ad6', '2c2ea4c915f744ed40a129e57caf5c58', '85980', 'guaira', 'PR'),
    ('eee2b3edbdcc9e6a0af7327a35023a10', '71273ccf833448b454fb8398754caa92', '07251', 'guarulhos', 'SP'),
    ('f67c3132efd7fdbe82c5365dad71d736', 'b27e39a421d71a38ef5c84a0c4f453cd', '89520', 'curitibanos', 'SC');

-- ============================================================================
-- 2. SELLERS (9 rows)
-- ============================================================================
INSERT INTO sellers (seller_id, seller_zip_code_prefix, seller_city, seller_state) VALUES
    ('08d2d642cf72b622b14dde1d2f5eb2f5', '17512', 'marilia', 'SP'),
    ('4da0e408c99d2fdc2126dc9fce518060', '86300', 'cornelio procopio', 'PR'),
    ('5c3460cd3e8a984382ae254e7dd20d9f', '15085', 'sao jose do rio preto', 'SP'),
    ('709e16e2b25c7474d980076c6bfc4806', '16200', 'birigui', 'SP'),
    ('8b321bb669392f5163d04c59e235e066', '01212', 'sao paulo', 'SP'),
    ('9f505651f4a6abe901a56cdc21508025', '04102', 'sao paulo', 'SP'),
    ('db2956745b3a8e9f3785c99f34b5d25e', '11600', 'sao sebastiao', 'SP'),
    ('de722cd6dad950a92b7d4f82673f8833', '51250', 'recife', 'PE'),
    ('dee656f0f566ed1aa85bd137c943f08f', '12701', 'cruzeiro', 'SP');

-- ============================================================================
-- 3. PRODUCTS (25 rows)
-- ============================================================================
INSERT INTO products (product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm) VALUES
    ('060c17562f97e5bb60bc0dfa4dd5b3f2', 'informatica_acessorios', 40, 675, 1, 150, 18, 6, 14),
    ('07810038e53a9f409577581bae23fa1a', 'informatica_acessorios', 53, 177, 5, 150, 16, 3, 17),
    ('0798196b28c04c8e543322896c882902', 'informatica_acessorios', 60, 527, 1, 450, 17, 2, 17),
    ('0d79e2972015716ede4fabeb5b60f8c6', 'market_place', 50, 257, 3, 2150, 40, 25, 30),
    ('0f1734abf5ee5d3b99353b7ccb117426', 'relogios_presentes', 33, 194, 2, 200, 18, 6, 17),
    ('163da86e86f0089de089399c28c3fcbb', 'informatica_acessorios', 60, 407, 3, 400, 16, 3, 21),
    ('27fdfad2c6a8f91606eb41ea396785c6', 'eletronicos', 39, 410, 1, 200, 25, 7, 16),
    ('2e513e110e3f95926fa3d1ac44444ff4', 'eletronicos', 56, 320, 1, 150, 24, 8, 16),
    ('3dd2a17168ec895c781a9191c1e95ad7', 'informatica_acessorios', 48, 894, 1, 533, 22, 11, 20),
    ('6b770b5934dbdb29064efdf34bfa6cf5', 'esporte_lazer', 53, 492, 1, 750, 35, 20, 20),
    ('75b433ca888fe027b18dfac89a284667', 'eletronicos', 37, 374, 1, 1350, 33, 12, 26),
    ('76c73618750ec1718b6f51a96c498f93', 'beleza_saude', 57, 844, 3, 575, 25, 13, 16),
    ('7ce94ab189134e2d3c05f496d635419c', 'eletronicos', 39, 400, 1, 200, 25, 7, 16),
    ('867b820367ec206b38a357f2c12454b7', 'bebes', 40, 811, 3, 200, 38, 8, 38),
    ('87a71ae93900ab55fcf685c8040769b3', 'eletronicos', 36, 401, 1, 175, 22, 13, 17),
    ('909b87db6cb3a7ab26bd03cc59860136', 'informatica_acessorios', 28, 1111, 1, 169, 16, 10, 12),
    ('ac0bb4405e9661957160dd5ee9d5585c', 'brinquedos', 54, 407, 5, 1250, 45, 8, 26),
    ('b192be433004cc1f10b467c0e9ea309b', 'informatica_acessorios', 57, 977, 1, 725, 25, 8, 24),
    ('c3097e07a0a5de0d4b4c836d90c5a284', 'eletronicos', 43, 425, 1, 200, 22, 11, 16),
    ('c9e370a48c93410b221b46ce7ee41643', 'informatica_acessorios', 59, 297, 2, 700, 20, 50, 18),
    ('d04857e7b4b708ee8b8b9921163edba3', 'informatica_acessorios', 33, 1127, 2, 450, 16, 4, 20),
    ('d9235fea02ba3f9fafcd78d898ac4355', 'construcao_ferramentas_iluminacao', 54, 929, 5, 1300, 22, 15, 18),
    ('fc8595227785863846b7daa2ae3f2c9b', 'beleza_saude', 60, 886, 1, 400, 20, 12, 12),
    ('fe2eb4afacc06314372f75be9c2859ff', 'informatica_acessorios', 57, 208, 2, 150, 20, 4, 18),
    ('fff0a542c3c62682f23305214eaeaa24', 'papelaria', 23, 146, 3, 300, 30, 10, 20);

-- ============================================================================
-- 4. ORDERS (27 rows)
-- ============================================================================
INSERT INTO orders (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date) VALUES
    ('04f1689642ed3c3e45244d4f7b2fe731', '6750172272a6a616067b595a9aa0d6c2', 'delivered', '2018-08-20 12:05:01', '2018-08-20 15:34:38', '2018-08-21 14:46:00', '2018-08-29 16:51:10', '2018-10-01 00:00:00'),
    ('05b771d711b0fa6d8ca9f42c3cc29f41', '79b4e6917237551454e77c23285fa09a', 'delivered', '2017-08-08 17:54:37', '2017-08-08 18:10:17', '2017-08-10 16:13:54', '2017-08-14 21:23:02', '2017-08-30 00:00:00'),
    ('0f227f29d1cef44dd442c2fe75d7896c', '3e6ee83b129d8611fe4e39d47b18d8c6', 'delivered', '2018-01-12 15:23:34', '2018-01-12 15:30:30', '2018-01-15 17:25:49', '2018-01-27 14:28:43', '2018-02-06 00:00:00'),
    ('1056d9c713cf16970b44a1994cbdebb3', 'f67c3132efd7fdbe82c5365dad71d736', 'delivered', '2017-02-10 16:46:29', '2017-02-10 17:20:26', '2017-02-13 12:54:08', '2017-02-17 10:28:02', '2017-03-13 00:00:00'),
    ('15c44e9d99f042b11c5f0b4d8a7d96b8', '8016d8085d0ac1f2b9f92022d07f1ee8', 'delivered', '2018-06-21 09:34:58', '2018-06-21 09:59:06', '2018-06-21 14:34:00', '2018-06-26 18:44:40', '2018-07-23 00:00:00'),
    ('24e0c8a6c71a0f631d7bae7a647aa5cf', 'eee2b3edbdcc9e6a0af7327a35023a10', 'delivered', '2018-07-23 22:27:49', '2018-07-24 10:31:01', '2018-07-24 14:52:00', '2018-07-26 17:53:18', '2018-07-31 00:00:00'),
    ('32b34a1a1642bd401996260030618dfb', 'e8d994960222368ac5e42a9109cffb19', 'delivered', '2018-05-02 16:34:47', '2018-05-04 03:52:03', '2018-05-04 14:34:00', '2018-05-11 20:06:50', '2018-06-07 00:00:00'),
    ('355730bf737146add585953ad0759407', 'b148e229c3c9f7260f706caf5ff17d23', 'delivered', '2018-03-08 20:01:04', '2018-03-08 20:10:32', '2018-03-09 20:32:00', '2018-03-14 19:52:23', '2018-03-20 00:00:00'),
    ('36b5cc783d21a08a8a8f6cf537de2153', 'ed078a8771e5fe1d9b99bff595938736', 'delivered', '2018-08-11 16:15:42', '2018-08-11 16:25:10', '2018-08-13 16:20:00', '2018-08-21 18:08:42', '2018-08-20 00:00:00'),
    ('3ff3c14b693208d95c7a79ad6fe5c117', 'ed3456724c3939113ed2747629e87ad6', 'delivered', '2018-07-03 20:54:31', '2018-07-05 16:12:54', '2018-07-04 14:30:00', '2018-07-13 19:03:28', '2018-07-27 00:00:00'),
    ('4de95857f36acba5b547fa7a76e6a4c1', '5b21f3f793e9f6c8211c80e123d3f434', 'delivered', '2017-12-23 18:51:40', '2017-12-23 19:07:39', '2017-12-26 23:22:49', '2017-12-27 19:22:39', '2018-01-15 00:00:00'),
    ('5ba2ed250b6f47416b0a787bd4deba63', '8c28edb50beda68d7be316b7bfd1fcac', 'delivered', '2017-07-01 19:13:55', '2017-07-01 19:25:20', '2017-07-04 11:23:32', '2017-07-27 12:18:57', '2017-08-04 00:00:00'),
    ('6d03ab0713a35b9475f6c5ed0d989976', 'a5adb81886eb68c76f621cb69a2eb9f6', 'delivered', '2017-12-01 13:49:05', '2017-12-01 14:11:22', '2017-12-02 13:09:27', '2017-12-29 19:05:16', '2017-12-28 00:00:00'),
    ('785e849a702dab4672f0febcf4c1afc5', '8ac12be4103f6d1ad36d0c21efc8fd5f', 'delivered', '2018-04-15 19:32:36', '2018-04-16 19:32:34', '2018-04-20 18:26:38', '2018-04-26 17:09:05', '2018-05-23 00:00:00'),
    ('7a485479dbdf94502e471dbd3329a4e4', '07193e2fc8e6b8a63e6c080a3cff4d89', 'delivered', '2018-08-10 17:09:27', '2018-08-10 17:25:14', '2018-08-21 14:07:00', '2018-08-27 22:06:31', '2018-09-04 00:00:00'),
    ('7bf262f298d3a3e62a691b4bcb82916d', '21128c7bab1ce9de02ecd04bee493880', 'delivered', '2018-07-18 23:13:33', '2018-07-19 23:05:14', '2018-07-20 14:42:00', '2018-07-27 13:32:32', '2018-08-09 00:00:00'),
    ('9ad0a499e1f35f8609a2dd4ad6c203ca', 'ba918f303c01fdb6620798b7d144d9ba', 'delivered', '2018-04-11 11:25:31', '2018-04-11 11:50:14', '2018-04-11 21:12:58', '2018-04-17 19:18:30', '2018-04-27 00:00:00'),
    ('9c0ca649b4269a45a953747ae381d37c', '9f57e674f66d1758920393d010d9e969', 'delivered', '2018-08-10 20:18:50', '2018-08-10 20:30:31', '2018-08-13 14:14:00', '2018-08-16 21:41:07', '2018-08-27 00:00:00'),
    ('a14d7576c8e4ff4378798287af2faffb', 'd8c88eafe65e8e7210a84872fd488edd', 'delivered', '2018-06-10 13:34:49', '2018-06-10 13:51:36', '2018-06-11 06:47:00', '2018-06-18 15:58:28', '2018-07-26 00:00:00'),
    ('a96d3bc5d1e3315554ccd38f27ff5ef3', '8aa26613f99b460c27155238fd55ec7e', 'delivered', '2018-07-25 20:21:01', '2018-07-26 20:15:12', '2018-07-27 13:54:00', '2018-08-06 15:54:36', '2018-08-20 00:00:00'),
    ('afde95a684781b6fa700b1e2fc79416c', 'ab23995b2f7c718cd8c3b812ffd4d2e5', 'delivered', '2018-02-05 09:49:06', '2018-02-07 03:10:19', '2018-02-07 19:56:01', '2018-02-22 18:28:15', '2018-03-08 00:00:00'),
    ('c2ea1bba24e50ff0dae7d466c1e2986d', '81391dccf0ddecf22324b3ed34008079', 'delivered', '2018-04-02 13:16:39', '2018-04-02 13:30:12', '2018-04-04 19:02:27', '2018-04-05 20:21:48', '2018-04-12 00:00:00'),
    ('c4641ce744fc935456a95bc0c628a43c', 'cd717f4d257d83f8fc1444f73167b8d6', 'delivered', '2018-06-27 10:25:10', '2018-06-27 11:06:40', '2018-06-28 08:41:00', '2018-07-03 20:24:52', '2018-07-23 00:00:00'),
    ('cd94ef4b0f9a66ee1a1cedbeb590e534', '8cd2b07859256908ad3bf9ae3d9ef119', 'delivered', '2018-05-07 20:38:34', '2018-05-07 20:55:29', '2018-05-08 14:05:00', '2018-05-11 22:05:47', '2018-05-29 00:00:00'),
    ('d8b57220afe3f1416bb889cc0e61aa67', '69eb26a67cff49ff2040a3817602061c', 'delivered', '2018-03-12 17:23:56', '2018-03-12 17:35:56', '2018-03-13 22:48:38', '2018-04-06 23:51:04', '2018-04-04 00:00:00'),
    ('e97ffba03b587c280382be712f1e3478', '1632dff93175c88a137a7aa512194dce', 'delivered', '2018-06-23 08:23:22', '2018-06-23 08:35:13', '2018-06-25 19:10:00', '2018-06-27 00:32:28', '2018-07-05 00:00:00'),
    ('eb36186e43652c37fe13774f77e7271c', '227479d882d32260a182a621faeb2bc3', 'delivered', '2018-04-27 19:46:52', '2018-04-27 20:10:57', '2018-04-30 07:24:00', '2018-05-07 22:53:45', '2018-06-08 00:00:00');

-- ============================================================================
-- 5. ORDER_ITEMS (32 rows)
-- ============================================================================
INSERT INTO order_items (order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value) VALUES
    ('04f1689642ed3c3e45244d4f7b2fe731', 1, '76c73618750ec1718b6f51a96c498f93', '709e16e2b25c7474d980076c6bfc4806', '2018-08-22 15:31:25', 259.90, 20.99),
    ('05b771d711b0fa6d8ca9f42c3cc29f41', 1, 'c9e370a48c93410b221b46ce7ee41643', '08d2d642cf72b622b14dde1d2f5eb2f5', '2017-08-16 18:10:17', 58.00, 12.75),
    ('0f227f29d1cef44dd442c2fe75d7896c', 1, 'c3097e07a0a5de0d4b4c836d90c5a284', '8b321bb669392f5163d04c59e235e066', '2018-01-18 15:30:30', 13.70, 14.10),
    ('1056d9c713cf16970b44a1994cbdebb3', 1, '0d79e2972015716ede4fabeb5b60f8c6', '4da0e408c99d2fdc2126dc9fce518060', '2017-02-14 16:46:29', 76.90, 18.82),
    ('15c44e9d99f042b11c5f0b4d8a7d96b8', 1, '867b820367ec206b38a357f2c12454b7', '5c3460cd3e8a984382ae254e7dd20d9f', '2018-06-25 09:59:06', 37.47, 18.36),
    ('24e0c8a6c71a0f631d7bae7a647aa5cf', 1, '0798196b28c04c8e543322896c882902', '9f505651f4a6abe901a56cdc21508025', '2018-07-26 09:44:12', 289.00, 10.18),
    ('32b34a1a1642bd401996260030618dfb', 1, '2e513e110e3f95926fa3d1ac44444ff4', '8b321bb669392f5163d04c59e235e066', '2018-05-10 03:52:03', 17.99, 15.23),
    ('355730bf737146add585953ad0759407', 1, '87a71ae93900ab55fcf685c8040769b3', '8b321bb669392f5163d04c59e235e066', '2018-03-14 20:10:32', 12.90, 7.39),
    ('36b5cc783d21a08a8a8f6cf537de2153', 1, '163da86e86f0089de089399c28c3fcbb', '9f505651f4a6abe901a56cdc21508025', '2018-08-14 16:25:10', 99.00, 8.85),
    ('3ff3c14b693208d95c7a79ad6fe5c117', 1, '75b433ca888fe027b18dfac89a284667', '8b321bb669392f5163d04c59e235e066', '2018-07-06 08:31:34', 12.90, 18.23),
    ('4de95857f36acba5b547fa7a76e6a4c1', 1, 'fe2eb4afacc06314372f75be9c2859ff', '9f505651f4a6abe901a56cdc21508025', '2017-12-29 19:07:39', 49.00, 8.25),
    ('4de95857f36acba5b547fa7a76e6a4c1', 2, '07810038e53a9f409577581bae23fa1a', '9f505651f4a6abe901a56cdc21508025', '2017-12-29 19:07:39', 22.99, 8.25),
    ('5ba2ed250b6f47416b0a787bd4deba63', 1, '0f1734abf5ee5d3b99353b7ccb117426', '08d2d642cf72b622b14dde1d2f5eb2f5', '2017-07-06 19:25:20', 17.90, 34.15),
    ('6d03ab0713a35b9475f6c5ed0d989976', 1, 'fff0a542c3c62682f23305214eaeaa24', '08d2d642cf72b622b14dde1d2f5eb2f5', '2017-12-07 14:11:22', 7.50, 16.11),
    ('785e849a702dab4672f0febcf4c1afc5', 1, 'd9235fea02ba3f9fafcd78d898ac4355', 'dee656f0f566ed1aa85bd137c943f08f', '2018-04-20 19:31:22', 120.00, 23.42),
    ('7a485479dbdf94502e471dbd3329a4e4', 1, 'fc8595227785863846b7daa2ae3f2c9b', 'db2956745b3a8e9f3785c99f34b5d25e', '2018-08-21 17:25:14', 139.00, 19.07),
    ('7a485479dbdf94502e471dbd3329a4e4', 2, 'fc8595227785863846b7daa2ae3f2c9b', 'db2956745b3a8e9f3785c99f34b5d25e', '2018-08-21 17:25:14', 139.00, 19.07),
    ('7bf262f298d3a3e62a691b4bcb82916d', 1, 'ac0bb4405e9661957160dd5ee9d5585c', 'dee656f0f566ed1aa85bd137c943f08f', '2018-07-23 23:05:14', 149.99, 28.00),
    ('9ad0a499e1f35f8609a2dd4ad6c203ca', 1, '867b820367ec206b38a357f2c12454b7', '5c3460cd3e8a984382ae254e7dd20d9f', '2018-04-17 11:50:14', 37.47, 12.79),
    ('9c0ca649b4269a45a953747ae381d37c', 1, 'd04857e7b4b708ee8b8b9921163edba3', '9f505651f4a6abe901a56cdc21508025', '2018-08-14 20:30:22', 79.99, 18.66),
    ('a14d7576c8e4ff4378798287af2faffb', 1, '3dd2a17168ec895c781a9191c1e95ad7', 'de722cd6dad950a92b7d4f82673f8833', '2018-06-12 13:51:36', 149.90, 21.10),
    ('a96d3bc5d1e3315554ccd38f27ff5ef3', 1, 'b192be433004cc1f10b467c0e9ea309b', 'de722cd6dad950a92b7d4f82673f8833', '2018-07-30 20:15:12', 179.90, 39.53),
    ('a96d3bc5d1e3315554ccd38f27ff5ef3', 2, 'b192be433004cc1f10b467c0e9ea309b', 'de722cd6dad950a92b7d4f82673f8833', '2018-07-30 20:15:12', 179.90, 39.53),
    ('a96d3bc5d1e3315554ccd38f27ff5ef3', 3, 'b192be433004cc1f10b467c0e9ea309b', 'de722cd6dad950a92b7d4f82673f8833', '2018-07-30 20:15:12', 179.90, 39.53),
    ('afde95a684781b6fa700b1e2fc79416c', 1, '3dd2a17168ec895c781a9191c1e95ad7', 'de722cd6dad950a92b7d4f82673f8833', '2018-02-13 03:10:19', 149.90, 27.59),
    ('c2ea1bba24e50ff0dae7d466c1e2986d', 1, '7ce94ab189134e2d3c05f496d635419c', '8b321bb669392f5163d04c59e235e066', '2018-04-06 13:30:12', 13.65, 7.39),
    ('c4641ce744fc935456a95bc0c628a43c', 1, '867b820367ec206b38a357f2c12454b7', '5c3460cd3e8a984382ae254e7dd20d9f', '2018-06-29 11:06:40', 37.47, 18.36),
    ('cd94ef4b0f9a66ee1a1cedbeb590e534', 1, '6b770b5934dbdb29064efdf34bfa6cf5', '4da0e408c99d2fdc2126dc9fce518060', '2018-05-09 20:55:29', 50.00, 19.32),
    ('cd94ef4b0f9a66ee1a1cedbeb590e534', 2, '6b770b5934dbdb29064efdf34bfa6cf5', '4da0e408c99d2fdc2126dc9fce518060', '2018-05-09 20:55:29', 50.00, 19.32),
    ('d8b57220afe3f1416bb889cc0e61aa67', 1, '27fdfad2c6a8f91606eb41ea396785c6', '8b321bb669392f5163d04c59e235e066', '2018-03-16 17:35:56', 13.20, 18.23),
    ('e97ffba03b587c280382be712f1e3478', 1, '060c17562f97e5bb60bc0dfa4dd5b3f2', '9f505651f4a6abe901a56cdc21508025', '2018-06-26 08:31:38', 24.99, 7.44),
    ('eb36186e43652c37fe13774f77e7271c', 1, '909b87db6cb3a7ab26bd03cc59860136', 'de722cd6dad950a92b7d4f82673f8833', '2018-05-04 20:10:57', 40.00, 19.04);

-- ============================================================================
-- 6. VERIFY ROW COUNTS
-- ============================================================================
SELECT 'customers' AS tbl, COUNT(*) AS cnt FROM customers
UNION ALL SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items;