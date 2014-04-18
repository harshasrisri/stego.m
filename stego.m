coverImage = imread('test.jpg');
embedText = 'ECE573: Project Steganography By Team DesiDroid';

embed1 = transImage (coverImage, 'haar');
embed2 = transImage (embed1.HH, 'haar');
embed3 = transImage (embed2.HH, 'haar');

embed3.HH = embedMsg (embed3.HH, embedText);
embed3 = finalize (embed3);

embed2.HH = embed3.aft;
embed2 = finalize (embed2);

embed1.HH = embed2.aft;
embed1 = finalize (embed1, 'after.png');

extract1 = transImage (imread('after.png'), 'haar');
extract2 = transImage (extract1.HH, 'haar');
extract3 = transImage (extract2.HH, 'haar');

extractedText = extractMsg (extract3.HH);

sprintf ('Embedded Text:\n%s\n\nExtracted Text:\n%s', embedText, extractedText)