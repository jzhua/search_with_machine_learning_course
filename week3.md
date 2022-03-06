Level 1, classifying product names

    What precision (P@1) were you able to achieve?
        ~0.835

    What fastText parameters did you use?
        -epoch 25
        -lr 1
        -wordNgrams 2
        -thread 8   # seems to be the sweet spot for minimizing training time

    How did you transform the product names?
        Stripped HTML tags, punctuation, casing, and used snowball stemming

    How did you prune infrequent category labels, and how did that affect your precision?
        going from 0 -> 100 -> 200 minimum products made a fairly large difference in P@1, all other parameters constant:
          0: 0.765
          100: 0.803
          200: 0.83x

    How did you prune the category tree, and how did that affect your precision?
        Nothing fancy; I just went up one parent in the category tree

Level 2, deriving synonyms

    What 20 tokens did you use for evaluation?

    product types:
        headphone
        tablet
        phone
        humidifier
        camera

    brands:
        sony
        apple
        hp
        canon
        maytag

    models:
        trackpad
        ipad
        thinkpad
        zune
        ipod

    attributes:
        black
        light
        bluetooth
        wifi

    How did you transform the product names?
        Lowercased and stripped punctuation

    What fastText parameters did you use?
         -lr 0.1 -thread 4 -epoch 25

    What threshold score did you use?
        A threshold of ~0.70 seems reasonable about right

    What synonyms did you obtain for those tokens?
        orig: headphone
        orig: tablet
        orig: phone
        orig: humidifier
        	~ dehumidifier
        	~ 1gal
        orig: camera
        	~ 162megapixel
        	~ 103megapixel
        	~ 151megapixel
        	~ vr340
        	~ megapixel
        	~ 91megapixel
        	~ 182megapixel
        	~ 146megapixel
        	~ 203megapixel
        orig: sony
        orig: apple
        	~ iphone
        	~ ipad
        orig: hp
        orig: canon
        orig: maytag
        orig: trackpad
        orig: ipad
        	~ 3rd
        orig: thinkpad
        	~ ideapad
        	~ lifebook
        orig: zune
        orig: ipod
        	~ 4thgeneration
        orig: black
        orig: light
        orig: bluetooth
        	~ bluetoothcompatible
        orig: wifi

Level 3, synonyms with search:

I essentially used the same transformation as before, and set a threshold of 0.9

I ended up getting _far_ more results than before (fabshell returns 535 results). I am guessing that 
synonym generation and the search query needs additional tweaking.