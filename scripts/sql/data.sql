INSERT INTO user (username, password, email, is_admin) VALUES ('admin', 'admin', 'admin@email.com', 1);
INSERT INTO user (username, password, email, is_admin) VALUES ('user', 'user', 'user@email.com', 0);
INSERT INTO author (name) VALUES ('J.K. Rowling');
INSERT INTO author (name) VALUES ('Mary GrandPré');
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Scholastic Inc.', 'rytlhsitcrexdaa', 'pxntjbghnuxhka@ppuer.com', '2906701286175929');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '3521081583');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '8539669065');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439785969, 'Harry Potter and the Half-Blood Prince (Harry Potter  #6)', 652, '9/16/2006', 'eng', 'xrhzqlwspvtpkdjnittsntzsohxevjtcnackchojbrfxpepbqcumouoticmyscmrcziwqklcpbrmwkjzidlxjlqicsnofodvpixhsmhacrrnifzlwusdvbkpgwyonbqxrlkazjoyieearfpdxnigasoelrfxjvhmjvzlhxeudejfmkxnblqdewedsuccnpnzrmldxwuhdbtnxatdouhmsahzlkcljhkrryptakegk', 96.88, 14.731984243894807, 38, 'Scholastic Inc.');
INSERT INTO genre (isbn, name) VALUES ('9780439785969', 'horror');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439785969', 'J.K. Rowling', 1);
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439785969', 'Mary GrandPré', 0);
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '5445275729');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '6452636413');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439358071, 'Harry Potter and the Order of the Phoenix (Harry Potter  #5)', 870, '9/1/2004', 'eng', 'sldobihjctrqwqjlzccodpyquwpsuzteeosdbqsrsmynaatomqoywrscnwsyazijktrlgmfsrzugirhfbbqpuhierhvfojfmhsmnychtxweyuindingxoq', 16.26, 2.0774909344408905, 54, 'Scholastic Inc.');
INSERT INTO genre (isbn, name) VALUES ('9780439358071', 'fiction');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439358071', 'J.K. Rowling', 1);
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439358071', 'Mary GrandPré', 0);
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Scholastic', 'owqdndanvrz', 'tbnwisqalf@fyjfnsiye.com', '6171039105386028');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '6164253404');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '7822506163');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439554893, 'Harry Potter and the Chamber of Secrets (Harry Potter  #2)', 352, '11/1/2003', 'eng', 'lqxmrerxinxzclktyzsmpntmvcmhxmbkruvqnpmhcxwszghehieojoukosmkxymnxgmlazynyafubcntbovtotjhbudubpplrvtdyrbovhfonlbaw', 78.93, 9.514997906791505, 18, 'Scholastic');
INSERT INTO genre (isbn, name) VALUES ('9780439554893', 'fantasy');
INSERT INTO genre (isbn, name) VALUES ('9780439554893', 'horror');
INSERT INTO genre (isbn, name) VALUES ('9780439554893', 'fiction');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439554893', 'J.K. Rowling', 1);
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '5408698095');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '9193557552');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439655484, 'Harry Potter and the Prisoner of Azkaban (Harry Potter  #3)', 435, '5/1/2004', 'eng', 'eslkrcghqhyuwfnczekoxwibznngwayyofyanitmsorgrbbiljlaxcjpbxumjqtlvffubdmsvshngayliremxzpdysiailxcrxzvwymutfpuqbsvpcasgggpyefjrqdqaihrvehlwsutksaqnerbdfgmxxmhvaaoajdxbhxzzqaqqlbreyhqejnyofgiizknwnhmgcqiyoomprbkbxsvjpjsllvairyrpofkwwrxlhikshpswazdytwnx', 72.16, 15.898557275840544, 1, 'Scholastic Inc.');
INSERT INTO genre (isbn, name) VALUES ('9780439655484', 'mystery');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439655484', 'J.K. Rowling', 1);
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439655484', 'Mary GrandPré', 0);
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '3527088516');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '7118176312');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439682589, 'Harry Potter Boxed Set  Books 1-5 (Harry Potter  #1-5)', 2690, '9/13/2004', 'eng', 'enbcllgfupzyzphlrbjaumqbphneqxnxwjctwkwamjezidcbnshcqihpdjiedjdpujxquhfzhrtwyddlvqchguzwjdoztvwyftdxzayojxnerjyuxrdeiecosfocpjrqtoticoabhimahxtkifl', 66.63, 7.009397941759094, 31, 'Scholastic');
INSERT INTO genre (isbn, name) VALUES ('9780439682589', 'comedy');
INSERT INTO genre (isbn, name) VALUES ('9780439682589', 'non-fiction');
INSERT INTO genre (isbn, name) VALUES ('9780439682589', 'horror');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439682589', 'J.K. Rowling', 1);
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439682589', 'Mary GrandPré', 0);
INSERT INTO author (name) VALUES ('W. Frederick Zimmerman');
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Nimble Books', 'plvhzzicmblvuhu', 'zlekqsaijs@ssepzvauf.com', '6805724358888800');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Nimble Books', '1342490177');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Nimble Books', '5862918682');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780976540601, 'Unauthorized Harry Potter Book Seven News: "Half-Blood Prince" Analysis and Speculation', 152, '4/26/2005', 'en-US', 'hprdvhwsshhdxnkbkdxuraaeeiucrubxhcqvchujywilikdhuhvnlebjwlandaihgstdgqsmswhvahvoycmgzhmcnytekbbobqbaphpcwltmuqwcpgjetmidgfyqbwwfzycvyxbjqlhyeyvvuaoluyycxuceawdbtmdurflpjevkcfelcsiedkalhhwschihncupzkgnnzltpgwcmjvvlnybdejhkmgoozgwybstpiryredjhmrrd', 15.63, 2.9082678642277764, 84, 'Nimble Books');
INSERT INTO genre (isbn, name) VALUES ('9780976540601', 'thriller');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780976540601', 'W. Frederick Zimmerman', 1);
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '6850558382');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '2431499905');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439827607, 'Harry Potter Collection (Harry Potter  #1-6)', 3342, '9/12/2005', 'eng', 'bjdkoqhupujmhsljvyztnlpciisvxbrnxuadlsoctoabmtsmatkusglyqxonzaqwzeyasekqfnrviybmzegjrwaqhpfsayfhzldazefkablimrovf', 69.81, 13.71654488614347, 36, 'Scholastic');
INSERT INTO genre (isbn, name) VALUES ('9780439827607', 'romance');
INSERT INTO genre (isbn, name) VALUES ('9780439827607', 'non-fiction');
INSERT INTO genre (isbn, name) VALUES ('9780439827607', 'drama');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439827607', 'J.K. Rowling', 1);
INSERT INTO author (name) VALUES ('Douglas Adams');
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Gramercy Books', 'abicwqocsycmxixxxre', 'rqatliiqjxh@xwayqw.com', '6342873392524706');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Gramercy Books', '6342694941');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Gramercy Books', '4594025087');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780517226957, 'The Ultimate Hitchhikers Guide: Five Complete Novels and One Story (Hitchhikers Guide to the Galaxy  #1-5)', 815, '11/1/2005', 'eng', 'lxxhelkctstjhrslyvynzxraskmvabbydcuoedqpmnzganheqnvhcvioabvlqqqwvokizynproafipgxinvrinpoebkrrqfidshdyieixdvmwebhwrsxojnznxrumpcmqtcjhldumitllpalpbgioaigpqbnuhabeogolbutnj', 64.83, 8.64170647189942, 62, 'Gramercy Books');
INSERT INTO genre (isbn, name) VALUES ('9780517226957', 'non-fiction');
INSERT INTO genre (isbn, name) VALUES ('9780517226957', 'horror');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780517226957', 'Douglas Adams', 1);
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Del Rey Books', 'oihzdzphafstkt', 'azzjuewwsxv@arrscedyu.com', '7716869445754715');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Del Rey Books', '1269450119');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Del Rey Books', '1940064553');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780345453747, 'The Ultimate Hitchhikers Guide to the Galaxy (Hitchhikers Guide to the Galaxy  #1-5)', 815, '4/30/2002', 'eng', 'pouuvwjmrqakxjuuhzwftdgiatidnxzibggirxbarqrbdbrqrctnksbyxiwpzqukchsvfsfvftwbkccsrwajsvhocvfevvgxnelpxyhyaqigfilixfytwjhmyliegsysdzhotssoayyrhfbcxxgqruiwwenwroqnouannflbmcchzzxgwamevnxfnioykdsqmiblxekuubszwseizaco', 58.39, 8.563093644793367, 33, 'Del Rey Books');
INSERT INTO genre (isbn, name) VALUES ('9780345453747', 'fantasy');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780345453747', 'Douglas Adams', 1);
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Crown', 'barmewankobgkc', 'uzvufytdyfxm@ehgqv.com', '4318695961606392');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Crown', '6447965348');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9781400052929, 'The Hitchhikers Guide to the Galaxy (Hitchhikers Guide to the Galaxy  #1)', 215, '8/3/2004', 'eng', 'dtwaqiehipxdlqxohqycsovtspulaoqzxpmahipnglfxqdhwcfpnyyxkvjnvrbiqhvzajoafvqwlxzejxoougstxohranmmilyhyozfejzgzebdp', 80.57, 16.792396777505264, 12, 'Crown');
INSERT INTO genre (isbn, name) VALUES ('9781400052929', 'mystery');
INSERT INTO genre (isbn, name) VALUES ('9781400052929', 'thriller');
INSERT INTO genre (isbn, name) VALUES ('9781400052929', 'fiction');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9781400052929', 'Douglas Adams', 1);
