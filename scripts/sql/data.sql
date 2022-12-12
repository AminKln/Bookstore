INSERT INTO user (username, password, email, is_admin) VALUES ('admin', 'admin', 'admin@email.com', 1);
INSERT INTO user (username, password, email, is_admin) VALUES ('user', 'user', 'user@email.com', 0);
INSERT INTO author (name) VALUES ('J.K. Rowling');
INSERT INTO author (name) VALUES ('Mary GrandPré');
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Scholastic Inc.', 'xbhzlgnvngk', 'oqugfrkmuiig@kvyvysv.com', '8658896698638172');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '2066907045');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '7072193026');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439785969, 'Harry Potter and the Half-Blood Prince (Harry Potter  #6)', 652, '9/16/2006', 'eng', 'makkpparkxnobissbnjgfvvqviofkatiftdixlfikjzzbogjmewqbwqgtbulowaxuqjrhtqgyrdcbzadheuewshyutaislqgwkvtubrtbvzivzjhgfyaiqrnjreologxxkkxlnvmnpnocqxjatxoeniaigltzttqaudkrbkmcyzfacebqcsmiboyeobcvqh', 13.11, 2.389052696582081, 78, 'Scholastic Inc.');
INSERT INTO genre (isbn, name) VALUES ('9780439785969', 'science-fiction');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439785969', 'J.K. Rowling', 1);
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439785969', 'Mary GrandPré', 0);
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '4095785028');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '2359316760');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439358071, 'Harry Potter and the Order of the Phoenix (Harry Potter  #5)', 870, '9/1/2004', 'eng', 'xhoysnecpwqtbhzwtlyifcszxcjcpntpudrwxfeuftxwtypjwubjxwmntuxhhvyongquhasmvwoafgxzpthwsphhbnhcfdqqdzgubciijlydzhezaoqanmibkpqzkrlmmggwfpcuvdlbqvanwvopqlnr', 31.90, 3.4818668501613024, 2, 'Scholastic Inc.');
INSERT INTO genre (isbn, name) VALUES ('9780439358071', 'horror');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439358071', 'J.K. Rowling', 1);
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439358071', 'Mary GrandPré', 0);
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Scholastic', 'ujopvekbofw', 'qarwfmjbfbobit@njpzuryae.com', '9390163170503782');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '3858472758');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439554893, 'Harry Potter and the Chamber of Secrets (Harry Potter  #2)', 352, '11/1/2003', 'eng', 'dgcicntfpppkngrgsjefaipjkyzbpnvcpmprjrptyesnbvzhfmjqzpfodnugcfzjaizdryzouvabyjpouwjpevlcnajadhkneeqastwihcaecgttzruzasezsfyotsxwibvjfowdmmvjsnqftgwxcolxczpuagwvsftrqrztfxehuzsadfqakrbchwgzlidnnyyqfojtqfoibztnzowfielsmrtcmitxbhqzqqdccyefvxf', 53.80, 9.623208731538607, 48, 'Scholastic');
INSERT INTO genre (isbn, name) VALUES ('9780439554893', 'fiction');
INSERT INTO genre (isbn, name) VALUES ('9780439554893', 'comedy');
INSERT INTO genre (isbn, name) VALUES ('9780439554893', 'horror');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439554893', 'J.K. Rowling', 1);
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic Inc.', '6897514719');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439655484, 'Harry Potter and the Prisoner of Azkaban (Harry Potter  #3)', 435, '5/1/2004', 'eng', 'hlbroydywioblocykwmovhatdhqtvohwbdgnkexdwvgkvjkqkxrrffjcvmxaobxugzmiciarujfhhekwljmpemkzehhvjicsoppdrwzujtyton', 70.25, 13.420239414169314, 35, 'Scholastic Inc.');
INSERT INTO genre (isbn, name) VALUES ('9780439655484', 'non-fiction');
INSERT INTO genre (isbn, name) VALUES ('9780439655484', 'fiction');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439655484', 'J.K. Rowling', 1);
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439655484', 'Mary GrandPré', 0);
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '6625095953');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '8968201187');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439682589, 'Harry Potter Boxed Set  Books 1-5 (Harry Potter  #1-5)', 2690, '9/13/2004', 'eng', 'paqdvfeikysgzxmgmuwcrgmauvegswksdzjivgkzeaatfnvzuglsijlehmqnyaberkbibzueloiddrvnmppfcdyvvpfvgvllmnifgvipaltnckordtkechgxfsfssphqumwvdjpsnorgdkqkqvqbfrygslqjmyfttsfwffpqyzdeiguvphf', 78.11, 17.751751721132543, 79, 'Scholastic');
INSERT INTO genre (isbn, name) VALUES ('9780439682589', 'mystery');
INSERT INTO genre (isbn, name) VALUES ('9780439682589', 'fantasy');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439682589', 'J.K. Rowling', 1);
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439682589', 'Mary GrandPré', 0);
INSERT INTO author (name) VALUES ('W. Frederick Zimmerman');
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Nimble Books', 'nuwxmnsjotwysznl', 'npxmpykavts@huunqveo.com', '1340194459417878');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Nimble Books', '2794386680');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780976540601, 'Unauthorized Harry Potter Book Seven News: "Half-Blood Prince" Analysis and Speculation', 152, '4/26/2005', 'en-US', 'lguympjhdhqnjnkkqfxjkxwzwywdnsdjlyiwexienqvzlaqsiftczmslompjwjwndpocihagsfywgzsmgnoqyiejnhuujgexnfxkfqsmqhzvlytdvhvmiqhgnxvkkcnrjrteqrbciqveiwkvozwygroaisrmfhwvwoyaiavbufuauggdyhkoxbaqcrzkqkhyaiqw', 47.92, 9.261951221364516, 51, 'Nimble Books');
INSERT INTO genre (isbn, name) VALUES ('9780976540601', 'fantasy');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780976540601', 'W. Frederick Zimmerman', 1);
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Scholastic', '8773760535');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780439827607, 'Harry Potter Collection (Harry Potter  #1-6)', 3342, '9/12/2005', 'eng', 'mvlsswygyqmlgqltxfseviqaydjdiuzuvhovvcpmnotfbzktlmpizjifpjnupipgujlcrquhknzzermnekojlitppfxjzxfookjlmlsfmijdochiygyjteneksxhbdjvuhxxumfwdnqijsjgjnys', 15.47, 2.139006162839874, 37, 'Scholastic');
INSERT INTO genre (isbn, name) VALUES ('9780439827607', 'thriller');
INSERT INTO genre (isbn, name) VALUES ('9780439827607', 'science-fiction');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780439827607', 'J.K. Rowling', 1);
INSERT INTO author (name) VALUES ('Douglas Adams');
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Gramercy Books', 'gpqvnpnaaltys', 'vyipczqixagpos@ntgcpsb.com', '6896904523388622');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Gramercy Books', '1124694486');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780517226957, 'The Ultimate Hitchhikers Guide: Five Complete Novels and One Story (Hitchhikers Guide to the Galaxy  #1-5)', 815, '11/1/2005', 'eng', 'gbduyrhfngbhvvmcgwblzxpncqpwdrrgtzxjsmzuzpvrndjoiyhahwqkuwjrbrgxvmliwmwwefqksebiiejoqhkszvrtvaeiqkrioxfbpceewbivcdzlvgxjgvpimaimpoluyeqbjoukqrf', 48.36, 12.036598634574887, 46, 'Gramercy Books');
INSERT INTO genre (isbn, name) VALUES ('9780517226957', 'horror');
INSERT INTO genre (isbn, name) VALUES ('9780517226957', 'fantasy');
INSERT INTO genre (isbn, name) VALUES ('9780517226957', 'science-fiction');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780517226957', 'Douglas Adams', 1);
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Del Rey Books', 'yhpqoiqeelskgbq', 'pozvyhtcrj@hbnymi.com', '8494924551514269');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Del Rey Books', '5951607377');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9780345453747, 'The Ultimate Hitchhikers Guide to the Galaxy (Hitchhikers Guide to the Galaxy  #1-5)', 815, '4/30/2002', 'eng', 'wbttufrejpnfmusesdeuvnvdnogmusskdpdpzlxduqpimjoesusvjzyppdvgwlsnejeuepdzvanmflwyzjndnamrbhoypwlfidrhbueeakkolrquoclotstyltnneshztngjzguoikpcyfsbxnjqpfemafjzdstijgaerjjhnqqifqthaxooofvvmmmhzjsktxytrffsjinczzjwvvxwfmeoldkblplmoqdeaddvh', 37.28, 8.873165836689262, 70, 'Del Rey Books');
INSERT INTO genre (isbn, name) VALUES ('9780345453747', 'comedy');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9780345453747', 'Douglas Adams', 1);
INSERT INTO publisher (name, address, email, bank_account) VALUES ('Crown', 'sngmvplatnyrzvx', 'uzndjdjlkedlga@migaa.com', '7693173726994889');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Crown', '5179932494');
INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('Crown', '6920655787');
INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, publisher_fees, count, publisher) VALUES
                        (9781400052929, 'The Hitchhikers Guide to the Galaxy (Hitchhikers Guide to the Galaxy  #1)', 215, '8/3/2004', 'eng', 'kxucwldsqlhzhkccfzmydpftpumiyxricqaogveeigarwtzsgquvylfjtxilfnaxgjsmoamlxdsdyxwithrnaitqfzzosxyqefybapgujlrrmxexjuwotgdozdxmxlk', 55.46, 11.250290902072253, 21, 'Crown');
INSERT INTO genre (isbn, name) VALUES ('9781400052929', 'fiction');
INSERT INTO genre (isbn, name) VALUES ('9781400052929', 'fantasy');
INSERT INTO genre (isbn, name) VALUES ('9781400052929', 'drama');
INSERT INTO written_by (isbn, author, is_primary) VALUES ('9781400052929', 'Douglas Adams', 1);
