//
//  Cocktail List.swift
//  Cocktails
//
//  Created by Josh Smith on 2/25/22.
//

import Foundation

let cocktails: [Cocktail] = [
    Cocktail(
        number: 1, category: .brandy, name: "Brandy Alexander",
        flavorProfile: "Sweet, Creamy, Choclate, Caramel/Vanilla from the Brandy.",
        history: "The Brandy Alexander was most likely created in the early 1920's by bartender Troy Alexander. The cocktail was created for a party celebrating clean coal, and he wanted to create a \"white\" cocktail to represent the fictional clean coal character Phoebe Snow. This version was made with gin, but an unknown bartender took the recipe and changed it to brandy. This was also a favorite cocktail of John Lennon, who famously would say it tasted like a boozy chocolate milkshake.",
        ingredients: [
            Ingredient(.cognac, amount: 1.5),
            Ingredient(.cremeDeCacao, amount: 1),
            Ingredient(.heavyCream, amount: 1),
            Ingredient(.groundNutmeg, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.","Add ice and shake for 20 seconds.","Double strain into coupe or martini glass.", "Garnish with fresh ground nutmeg using microplane."],
        supplies: [.shaker, .strainer, .fineStrainer, .jigger, .microplane, .glasses([.coupe, .martini])],
        tip: "Fun Tip: For a stronger chocolate milkshake flavor add more crème de cacao and less brandy."
    ),
    Cocktail(
        number: 2, category: .brandy, name: "Brandy Flip", flavorProfile: "Sweet, Rich, Thick, Reminds you of Christmas.",
        history: "The term \"flip\" dates back to the late 1600s and refers to a drink consisting of beer, rum, eggs, and sugar. Flipping occurred by added a red-hot iron to the drink causing it to froth or \"flip.\" The version known today was first seen in Jerry Thomas's book called the Cocktails's Guide. It is typically made with brandy or sherry. The cocktail is also very closely related to eggnog, simply add cream or milk!",
        ingredients: [
            Ingredient(.brandy, amount: 2),
            Ingredient(.demeraraSugar, amount: 0.75),
            Ingredient(.egg, amount: 1),
            Ingredient(.groundNutmeg, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Dry shake for 20 seconds (no ice).", "Add ice and shake for 8-10 seconds.", "Double strain into small stemmed glass or coupe.", "Garnish with fresh ground nutmeg."],
        supplies: [.shaker, .strainer, .fineStrainer, .jigger, .glasses([.stemmed, .coupe]), .microplane],
        tip: "Fun Fact: To make eggnog use the same recipe, and add 1 oz of heavy cream or 2 oz of milk!"
    ),
    Cocktail(
        number: 3, category: .brandy, name: "Sidecar", flavorProfile: "Tart, Crisp, Orange, Fruity, Hint of Grape.",
        history: "The Sidecar is a cocktail created during Prohibition but originating in France. Many popular cocktails were coming from Europe at this time as many American bartenders moved to Europe looking for work. It is difficult to know exactly who created this cocktail, but it first became popular in the 1920s. Many bartenders claimed credit for inventing the cocktail including Harry McElhone and Robert Vermier.",
        ingredients: [
            Ingredient(.brandy, amount: 2),
            Ingredient(.orangeLiqueur, amount: 0.75),
            Ingredient(.lemonJuice, amount: 0.5),
            Ingredient(.sugarRim, amount: 0),
            Ingredient(.lemonPeel, amount: 0)
        ],
        instructions: ["Add sugar rim to coupe or martini glass.", "Place all ingredients into a shaker.", "Add ice and shake for 8-10 seconds.", "Double strain into coupe or martini glass.", "Garnish with lemon peel."],
        supplies: [.shaker, .strainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .martini])],
        tip: "Helpful Tip: Orange liqueurs can vary in sweetness, so add or take away to best fit your palette"
    ),
    Cocktail(
        number: 4, category: .brandy, name: "Vieux Carré", flavorProfile: "Boozy, Sweet, Lightly Herbal, Bitter.",
        history: "Vieux Carré translates to \"Old Square\" and is a term used to reference the French Quarters in New Orleans. It was created by Walter Bergeron in 1938 at the famous Carousel bar inside Hotel Monteleone in New Orleans. At the Carousel Bar you sit down and slowly spin around the bartenders like a carousel. It was frequently visited by many famous authors including Ernest Hemingway and Truman Capote." ,
        ingredients: [
            Ingredient(.cognac, amount: 1),
            Ingredient(.ryeWhiskey, amount: 1),
            Ingredient(.sweetVermouth, amount: 1),
            Ingredient(.benedictine, amount: 1),
            Ingredient(.angosturaBitters, amount: 2),
            Ingredient(.peychaudsBitters, amount: 2),
            Ingredient(.lemonTwistOrCherry, amount: 0)
        ],
        instructions: ["Place all ingredients into mixing glass.", "Add ice and stir for 30 seconds.", "Strain into rocks glass over ice or large cube.", "Garnish with lemon twist or cherry."],
        supplies: [.mixingGlass, .strainer, .barSpoon, .jigger, .glass(.martini)],
        tip: "Similar Cocktails: Manhattan, Sazerac, Old Fashioned, Boulevardier, Martinez."
    ),
    Cocktail(
        number: 5, category: .brandy, name: "Wisconsin Old Fashioned", flavorProfile: "Fruity, Sweet, Raisin, Vanilla.",
        history: "The Wisconsin Old Fashioned was introduced in 1893 as part of the Chicago World's Fair. Brandy was getting difficult to obtain so an American liquor company called Korbel decided to make brandy and feature it as the World's Fair. Some Wisconsin natives were at the fair and loved it so much they took it home. Not long after that the Wisconsin Old Fashioned was born. Wisconsin is the largest US consumer of brandy and makes up over 50% of all Korbel sales.",
        ingredients: [
            Ingredient(.brandy, amount: 2),
            Ingredient(.orangeSlices, amount: 2),
            Ingredient(.maraschinoCherries, amount: 1),
            Ingredient(.sugarCube, amount: 1),
            Ingredient(.angosturaBitters, amount: 3),
            Ingredient(.sevenUp, amount: 0),
            Ingredient(.cherryAndOrangeSlice, amount: 0)
        ],
        instructions: ["Place orange wedges and cherry into glass.", "Add sugar cube and 3 dashes of Angostura bitters", "Lightly muddle everything until sugar is dissolved.", "Add ice to glass, pour in Brandy and stir glass.", "Add soda to taste.", "Garnish with orange wedge and cherry."],
        supplies: [.jigger, .barSpoon, .muddler, .glass(.doubleRocks)],
        tip: "Helpful Tips: Add 7-UP for \"sweet\", Squirt for \"sour\", or soda water for \"press\" style old fashioned."
    ),
    Cocktail(
        number: 6, category: .dessert, name: "Toffee Cocktail",
        flavorProfile: "Caramel, Sweet, Almond, Creamy, Chocolate.",
        history: "The Toffee cocktail has become an internet favorite. Regularly found on Pinterest, YouTube, and Instagram, this drink is becoming one of the more popular dessert cocktails. The inventor is unknown, but you'll be sure to impress your friends with this rich, sweet, and delicious drink!",
        ingredients: [
            Ingredient(.amaretto, amount: 1),
            Ingredient(.baileys, amount: 1),
            Ingredient(.kahlua, amount: 1),
            Ingredient(.heavyCream, amount: 2),
            Ingredient(.caramelAndShavedChocolate, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 20 seconds.", "Rim glass with caramel and shaved chocolate.", "Strain drink into glass.", "Garnish with more caramel and chocolate."],
        supplies: [.shaker, .strainer, .jigger, .glass(.martini)],
        tip: "Fun Tips: Add caramel and chocolate to the inside of the glass for a better presentation."
    ),
    Cocktail(
        number: 7, category: .dessert, name: "Chocolate Martini",
        flavorProfile: "Sweet, Chocolate, Bitter, Creamy.",
        history: "As the story goes the Chocolate Martini was created in 1955 by Elizabeth Taylor and Rock Hudson while filming Giant. They both were staying in rented houses across the street from each other and spent much time together outside of filming. When asked what inspired them, they said, \"We both love chocolate and we both love martinis, so why not put chocolate liquor in a vodka martini?\" The rest, as they say in Hollywood, is a wrap!",
        ingredients: [
            Ingredient(.vodka, amount: 1),
            Ingredient(.kahlua, amount: 0.75),
            Ingredient(.cremeDeCacao, amount: 0.75),
            Ingredient(.baileys, amount: 0.75),
            Ingredient(.heavyCream, amount: 0.5),
            Ingredient(.chocolateSyrupAndShavedChocolate, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 30 seconds.", "Add chocolate to inside of glass.", "Double strain into glass.", "Garnish with chocolate sauce and shaved chocolate."],
        supplies: [.shaker, .strainer, .jigger, .glass(.martini)],
        tip: "Helpful Tips: Use a squeeze bottle or bar spoon for running chocolate around inside of glass."
    ),
    Cocktail(
        number: 8, category: .dessert, name: "Grasshopper",
        flavorProfile: "Sweet, Minty, Chocolate, Creamy.",
        history: "The Grasshopper was reportedly created by Philibert Guichet, the owner of New Orleans famous Tujague's restaurant. The cocktail was created for a New York City cocktail competition and placed second in 1919. The following year Prohibition started and as a result many cocktails were not documented. However, a 1919 newspaper had the cocktail listed for its second-place prize. Tujague's is still thriving and still known for its signature Grasshop- per cocktail.",
        ingredients: [
            Ingredient(.cremeDeMentheGreen, amount: 1),
            Ingredient(.cremeDeCacao, amount: 1),
            Ingredient(.heavyCream, amount: 1),
            Ingredient(.groundNutmegOrChocolate, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 15-20 seconds.", "Double strain into coupe or martini glass.", "Garnish with fresh ground nutmeg or chocolate."],
        supplies: [.shaker, .strainer, .jigger, .glasses([.coupe, .martini])],
        tip: "Helpful Tips: For a boozier cocktail add 1oz of brandy, For a boozy milkshake add a scoop of vanilla or chocolate mint ice cream and serve in a larger glass,"
    ),
    Cocktail(
        number: 9, category: .dessert, name: "Tiramisu Cocktail",
        flavorProfile: "Coffee, Sweet, Rich, Chocolate, Savory.",
        history: "Tiramisu is the most popular dessert in the world, and it was only a matter of time until a cocktail would be created to match the flavor of this delicious coffee cake treat. Adam Ennis is credited for creating this cocktail at the Restaurant Isola in London, England in 2001. This cocktail not only includes an egg yolk, but has the addition of mascarpone cheese and could serve as its own dessert!",
        ingredients: [
            Ingredient(.cognacOrBrandy, amount: 1),
            Ingredient(.kahlua, amount: 0.5),
            Ingredient(.cremeDeCacao, amount: 0.5),
            Ingredient(.heavyCream, amount: 1),
            Ingredient(.eggYolk, amount: 1),
            Ingredient(.mascarponeCheese, amount: 1),
            Ingredient(.chocolatePowder, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 15-20 seconds.", "Remove ice and shake again for 30 seconds (reverse dry shake).", "Strain drink into glass.", "Garnish with chocolate powder."],
        supplies: [.shaker, .strainer, .jigger, .glasses([.smallCoupe, .coffee])],
        tip: "Helpful Tips: The reverse dry shake allows you to thicken your cocktail with longer shaking but without dilution."
    ),
    Cocktail(
        number: 10, category: .gin, name: "Aviation",
        flavorProfile: "Tart, Dry, Floral, Cherry, Herbal, Light.",
        history: "The Aviation was created by Hugo Ensslin, the head bartender at Hotel Wallick in New York in the early 1900s. It was considered one of the first \"industry\" drinks and if you ordered it, you were considered an insider in the cocktail world. The Aviation became less popular as crème de violette became more difficult to find and recipes often left it out. However, recently the original Aviation is making a comeback, and becoming a favorite once again.",
        ingredients: [
            Ingredient(.gin, amount: 2),
            Ingredient(.maraschino, amount: 0.5),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.cremeDeViolette, amount: 0.25),
            Ingredient(.lemonPeelOrDarkCharry, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker", "Add Ice to shaker and shake your drink for 8 10 seconds", "Double Strain into coupe or martini glass", "Garnish with lemon peel or cherry"],
        supplies: [.shaker, .strainer, .fineStrainer, .jigger, .juicer, .yPeeler, .glasses([.coupe, .martini])],
        tip: "Fun Tips: Crème de violette differs from brand to brand. and trving a new brand may slightly change the color of your cocktail"
    ),
    Cocktail(
        number: 11, category: .gin, name: "Bees Knees",
        flavorProfile: "Honey, Citrus, Herbal, Refreshing.",
        history: "The Bees Knees is a cocktail that was created during Prohibition with ingredients that would mask poor tasting bathtub gins. The original recipe called for equal parts, but nowadays our gin is delicious, and the recipe is now tweaked to highlight the gin. \"Bees Knees\" was an expression to highlight how amazing something was, and this cocktail was a favorite during Prohibition.",
        ingredients: [
            Ingredient(.gin, amount: 2),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.honeySyrup, amount: 0.75),
            Ingredient(.lemonTwist, amount: 0)
        ],
        instructions: ["Make the Honey Syrup by mixing 3-parts Honey with 1-part Hot Water, then let settle to room temperature.", "Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into stemmed glass.", "Garnish with lemon peel."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .yPeeler, .glass(.stemmed)],
        tip: "Fun Tips: If this drink has too much honey flavor, try changing your honey syrup ratio to 2:1 or even 1:1."
    ),
    Cocktail(
        number: 12, category: .gin, name: "Bramble",
        flavorProfile: "Blackberry, Tart, Jammy, Botanical, Refreshing.",
        history: "The Bramble was created in 1984 by Dick Bradsell in London. Often referred to as the Godfather of the London cocktail scene, Bradsell wanted to create a cocktail that reminded him of his childhood picking blackberries. He was famous for using fresh ingredients in his cocktails, and the Bramble ended up being one of his most popular cocktail creations.",
        ingredients: [
            Ingredient(.gin, amount: 2),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.5),
            Ingredient(.cremeDeMure, amount: 0.5),
            Ingredient(.lemonWedgeAndBlackberry, amount: 0)
        ],
        instructions: ["Place gin, lemon juice, and simple syrup into shaker.", "Add ice and shake for 15-20 seconds.", "Add ice to Lewis bag and pound ice until crushed (optional).", "Fill rocks glass with crushed ice, and strain cocktail.", "Pour layer of crème de mûre over top.", "Garnish with lemon wedge and blackberry."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .lewisBag, .glass(.rocks)],
        tip: "Helpful Tips: If you cannot find crème de mûre at the liquor store you could try making your own, or substituting Chambord, a black raspberry liqueur."
    ),
    Cocktail(
        number: 13, category: .gin, name: "Clover Club",
        flavorProfile: "Tart Raspberry, Creamy, Herbal.",
        history: "The Clover Club dates back to the 1880s and was the preferred drink of gentlemen before Prohibition. This cocktail was created by a men's group who met regularly at the Bellevue-Stratford Hotel and they called themselves the Clover Club. The club was exclusive to men in legal, literary, or business professions. The Clover Club cocktail is one of few cocktails to feature raspberries and is a favorite in the craft cocktail scene.",
        ingredients: [
            Ingredient(.gin, amount: 1.5),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.raspberrySyrup, amount: 0.75),
            Ingredient(.eggWhite, amount: 1),
            Ingredient(.raspberriesOrLemonZest, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker without ice.", "Give your drink a \"dry shake\" for 30 seconds.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into coupe or martini glass.", "No garnish needed, but raspberries are a popular choice."],
        supplies: [.shaker, .strainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .martini])],
        tip: "Raspberry Syrup: Boil 4 cups of water with 2 cups of raspberries for 20 minutes. Add 2 cups of sugar and let mixture come to room temperature, Bottle and store for up to 3 weeks."
    ),
    Cocktail(
        number: 14, category: .gin, name: "Corpse Reviver #2",
        flavorProfile: "Citrus, Herbal, Anise, Orange, Crisp.",
        history: "The Corpse Reviver #2 gets its name for being one of the original hangover \"cures.\" There are a few versions of Corpse Revivers, but this popular version was first published in Harry Craddock's famous Savoy Cocktail Book in 1930. This cocktail packs a punch as Craddock warns in his book \"four of these taken in swift succession will quickly unrevive the corpse again.",
        ingredients: [
            Ingredient(.gin, amount: 0.75),
            Ingredient(.orangeLiqueur, amount: 0.75),
            Ingredient(.cocchiAmericano, amount: 0.75),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.absinthe, amount: 0),
            Ingredient(.lemonTwist, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Place teaspoon of absinthe into glass and \"rinse\" the inside of the glass.", "Double strain into your glass.", "Garnish with lemon twist."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .nickAndNora])],
        tip: "Fun Fact: This cocktail was originally made with Kina Lillet that no longer exists. So, a popular substitute is Cocchi Americano or you can use the modern version Lillet."
    ),
    Cocktail(
        number: 15, category: .gin, name: "Enzoni",
        flavorProfile: "Grape, Bitter, Citrus, Herbal.",
        history: "The Enzoni was created by Vincenzo Errico while bartending at the famous Milk & Honey bar in New York City. Errico created this cocktail in 2003 after being trained by legendary barman Dick Bradsell, the creator of the Espresso Martini and the Bramble. This cocktail has become a favorite with many popular online bartending channels, and it's quickly becoming a modern classic!",
        ingredients: [
            Ingredient(.gin, amount: 1),
            Ingredient(.campari, amount: 1),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.5),
            Ingredient(.redGrapes, amount: 5),
            Ingredient(.orangeWedgeAndGrape, amount: 0)
        ],
        instructions: ["Place grapes to shaker and muddle.", "Add rest of ingredients to shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into rocks glass with ice or large ice cube.", "Garnish with grape and orange wedge."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .muddler, .glass(.rocks)],
        tip: "Helpful Tips: Try different grapes and see which ones you like the best in your Enzoni!"
    ),
    Cocktail(
        number: 16, category: .gin, name: "Gin Gimlet",
        flavorProfile: "Lime Citrus, Sweet, Herbal.",
        history: "The Gin Gimlet was created for the sole purpose of convincing sailors to consume more lime to help fight scurvy. The name is rumored to be after Rear-Admiral Sir Thomas Desmond Gimlette, who between 1879 and 1913 served navy strength gin with Rose's Lime Cordial as medicine, Sailors consumed this \"medicine\" so often they would soon become known as \"Limeys\".",
        ingredients: [
            Ingredient(.gin, amount: 2),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.75),
            Ingredient(.limeWheel, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into coupe or martini glass.", "Cut a lime wheel and place on rim of glass for garnish."],
        supplies: [.shaker, .strainer, .fineMeshStrainer, .jigger, .juicer, .glasses([.martini, .coupe])],
        tip: "Fun Tips: Make it a French Gimlet by substituting 1oz of St. Germain for simple syrup!"
    ),
    Cocktail(
        number: 17, category: .gin, name: "Grapefruit Drop",
        flavorProfile: "Citrus, Elderflower, Grapefruit, Crisp.",
        history: "The Grapefruit Drop was created by beloved Seattle bartender Scott MacFarlane. The cocktail was an immediate fan favorite at his restaurant the Sand Point Grill. While the drink only includes grapefruit in the garnish, the combination of ingredients will make you think you're drinking a grapefruit cocktail. Easy to make, and easy to drink. Scott's masterpiece is an easy choice!",
        ingredients: [
            Ingredient(.gin, amount: 1.5),
            Ingredient(.stGermain, amount: 1),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.sugarRimAndGrapefruitTwist, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Sugar rim of martini glass.", "Double strain into glass.", "Garnish with grapefruit twist."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .channelKnife, .glass(.martini)],
        tip: "Helpful Tips: If you don't want to buy a whole grapefruit to garnish, feel free to use a lemon twist instead!"
    ),
    Cocktail(
        number: 18, category: .gin, name: "Last Word",
        flavorProfile: "Tart, Herbal, Dry, Cherry, Juniper, Refreshing.",
        history: "The Last Word was originally created at the Detroit Athletic club in the 1920s and became so popular it was published in Ted Saucier's cocktail book Bottom's Up in 1951. After that though, the cocktail lost popularity and fell into obscurity. It wasn't until 2005 when legendary Seattle bartender Murray Stenson read the cocktail book and featured it on his menu at the Zig-Zag café in Seattle. The cocktail was so popular it spread across the country and has gone through a complete revival!",
        ingredients: [
            Ingredient(.gin, amount: 0.75),
            Ingredient(.greenChartreuse, amount: 0.75),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.maraschinoLiqueur, amount: 0.75),
            Ingredient(.maraschinoCherry, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into coupe or martini glass.", "Garnish with Maraschino cherry."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glasses([.coupe, .martini])],
        tip: "Fun Tips: Love Whiskey? Try this recipe by subbing out whiskey for the gin and create a Final Ward!"
    ),
    Cocktail(
        number: 19, category: .gin, name: "Martinez",
        flavorProfile: "Herbal, Cherry, Dry, Slightly Sweet, Savory.",
        history: "The Martinez is one of the oldest cocktails to ever be recorded, and widely regarded as the precursor to the popular Martini. While very difficult to know when the drink was first created, historians believe it was around the 1860s. The first written record is found in 1884 in the book The Modern Cocktails by O.H. Byrons. Early versions of the cocktail called for Dutch Genever, then switched to Old Tom Gin, and more recently made with dry gin for a less sweet flavor.",
        ingredients: [
            Ingredient(.dryGin, amount: 1.5),
            Ingredient(.sweetVermouth, amount: 1.5),
            Ingredient(.maraschino, amount: 0.25),
            Ingredient(.orangeBitters, amount: 2),
            Ingredient(.lemonPeel, amount: 0)
        ],
        instructions: ["Place all ingredients into mixing glass.", "Add ice and stir for 30 seconds.", "Strain into coupe or martini glass.", "Garnish with a lemon peel."],
        supplies: [.mixingGlass, .hawthorneStrainer, .barSpoon, .jigger, .yPeeler, .glasses([.coupe, .martini])],
        tip: "Fun Tips: Try the more traditional version and make this cocktail with Old Tom Gin and see which version you like most!"
    ),
    Cocktail(
        number: 20, category: .gin, name: "Martini",
        flavorProfile: "Herbal, Juniper, Dry, Hints of Citrus.",
        history: "The Martini is the most popular cocktail in the world, and yet the perfect martini is wildly contested from one person to the next. The Martini is a variation of the Martinez that dates back to the 1860s. Classically, this cocktail would include more vermouth, 2 dashes of orange bitters, and always include gin. The modern version uses less vermouth, typically does not include orange bitters, and is garnished with a lemon twist or olives. So, experiment and find your perfect Martinil",
        ingredients: [
            Ingredient(.gin, amount: 2.25),
            Ingredient(.dryVermouth, amount: 0.75),
            Ingredient(.oliveJuice, amount: 0.5),
            Ingredient(.cocktailOlives, amount: 0)
        ],
        instructions: ["Place gin and vermouth into mixing glass.", "Add ice and stir for 30 seconds.", "Strain into coupe or martini glass.", "Finish with your choice of garnish."],
        supplies: [.mixingGlass, .hawthorneStrainer, .barSpoon, .jigger, .yPeeler, .glasses([.coupe, .martini])],
        tip: "Fun Tips: A \"dry\" martini refers to using less vermouth, and a \"wet\" martini refers to adding more vermouth. Try them out and find your favorite combination!"
    ),
    Cocktail(
        number: 21, category: .gin, name: "Negroni",
        flavorProfile: "Bitter, Herbal, Sweet Tones, Juniper.",
        history: "The Negroni was created at Café Cassoni in Florence, Italy in 1919. Legend has it that Count Camillo Negroni asked his bartending friend, Forsco Scarselli, to strengthen his favorite cocktail - The Americano - by replacing the soda water with gin. This \"Negroni\" version became so popular it is now considered the most popular Campari cocktail in the world.",
        ingredients: [
            Ingredient(.gin, amount: 1),
            Ingredient(.campari, amount: 1),
            Ingredient(.sweetVermouth, amount: 1),
            Ingredient(.orangePeel, amount: 0)
        ],
        instructions: ["Place all ingredients into mixing glass.", "Add ice and stir for 30 seconds.", "Add ice or large ice cube to rocks glass.", "Strain cocktail into your glass.", "Garnish with an orange peel."],
        supplies: [.mixingGlass, .hawthorneStrainer, .barSpoon, .jigger, .yPeeler, .glass(.rocks)],
        tip: "Fun Tips: Love whiskey? Try the Boulevardier, it's a Negroni but substitutes whiskey for gin!"
    ),
    Cocktail(
        number: 22, category: .gin, name: "Ramos Gin Fizz",
        flavorProfile: "Lemon-Lime Tart, Cream, Herbal from Gin, Thick.",
        history: "The Ramos Gin Fizz was created by Henry C. Ramos in 1888 at his bar The Imperial Cabinet Saloon in New Orleans. It was originally called the New Orleans Fizz and is still one of the city's most popular cocktails. The Ramos Gin fizz is notorious for being labor intensive and Ramos would pass the shaker around the bar and let everyone give it a hefty shake, Your reward is a lemon lime cream-ci cle cocktail. Well worth the effort!",
        ingredients: [
            Ingredient(.gin, amount: 2),
            Ingredient(.lemonJuice, amount: 0.5),
            Ingredient(.limeJuice, amount: 0.5),
            Ingredient(.simpleSyrup, amount: 1),
            Ingredient(.heavyCream, amount: 1),
            Ingredient(.orangeFlowerWater, amount: 2),
            Ingredient(.eggWhite, amount: 1),
            Ingredient(.sodaWater, amount: 0)
        ],
        instructions: ["Add all ingredients minus egg white to shaker.", "Add ice and shake vigorously for 40 seconds.", "Double strain your cocktail back into shaker.", "Add egg white and dry shake (no ice) for 60 Seconds.", "Pour into Collins glass and leave ½ inch from the top.", "Let drink rest in fridge for 1-2 minutes.", "Carefully pour cold soda water in the middle of the glass to raise the foam top above the rim of the glass ~ (1-2oz)."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glass(.collins)],
        tip: "Helpful Tips: Can't find orange blossom water? Try grating about a teaspoon of orange peel into your drink!"
    ),
    Cocktail(
        number: 23, category: .gin, name: "Tom Collins",
        flavorProfile: "Lemon, Crisp, Refreshing, Light.",
        history: "The Tom Collins rose to fame by being a way to play a hoax on your friends. You would claim a gentleman at the bar named Tom Collins was saying very ill things about your friend, and they should go talk to him at once. So your friend would go to the bar, he would ask the bartender if he knew a Tom Collins, and the bartender would say \"yes, let me grab him.\" The bartender would then serve him this cocktail. The New York Times called it \"The Great Tom Collins Hoax of 1874.\" The cocktail dates back to the 1790s and is believed to have been created at Limmer's Old House, a popular London hotel.",
        ingredients: [
            Ingredient(.dryGin, amount: 2),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.75),
            Ingredient(.sodaWater, amount: 0),
            Ingredient(.lemonPeelOrCherry, amount: 0)
        ],
        instructions: ["Place all ingredients (except soda) into a shaker.", "Add ice and shake for 8-10 seconds.", "Add ice to your Collins glass and strain your cocktail into glass.", "Top off with soda water and garnish with lemon peel or wedge and a cherry."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glass(.collins)],
        tip: "Helpful Tips: Never add carbonated soda to your shaker tin. If you shake carbonated soda your tin will burst open from the pressure and spill your drink everywhere!"
    ),
    Cocktail(
        number: 24, category: .gin, name: "Vesper",
        flavorProfile: "Gin-Forward, Herbal, Hint of Spice, Slightly Sweet.",
        history: "The Vesper is the invention of author lan Fleming, who wrote the James Bond books. In Casino Royale James Bond orders a cocktail with \"3 parts Gin, 1 part Vodka, and 1 part Kina Lillet, shaken not stirred with a thin slice of lemon.\" We now know it's best to stir your martinis, but feel free to try this delicious martini shaken and see which version you enjoy most.",
        ingredients: [
            Ingredient(.gin, amount: 2.25),
            Ingredient(.vodka, amount: 0.75),
            Ingredient(.lillet, amount: 0.5),
            Ingredient(.lemonPeel, amount: 0)
        ],
        instructions: ["Place all ingredients into mixing glass.", "Add ice and stir for 30 seconds.", "Strain into coupe or martini glass.", "Garnish with lemon peel."],
        supplies: [.mixingGlass, .hawthorneStrainer, .barSpoon, .jigger, .yPeeler, .glasses([.martini, .coupe])],
        tip: "Fun Fact: This cocktail was originally made with Kina Lillet, which no longer exists. You can use the modern version Lillet, or a popular substitute is Cocchi Americano."
    ),
    Cocktail(
        number: 25, category: .gin, name: "White Lady",
        flavorProfile: "Citrus, Orange, Dry, Juniper, Creamy.",
        history: "The White Lady is thought to have been created by Harry McElhone while working at London's Ciro club in 1919 but was originally made with crème de menthe. When he opened up Harry's New York Bar in Paris, he changed it to gin. Later the cocktail was published in Harry Craddock's Savoy Cocktail Book. The White Lady was the favorite cocktail of comedy duo Laurel & Hardy.",
        ingredients: [
            Ingredient(.gin, amount: 1.5),
            Ingredient(.orangeLiqueur, amount: 1),
            Ingredient(.lemonJuice, amount: 0.5),
            Ingredient(.eggWhite, amount: 1),
            Ingredient(.lemonPeel, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Give your drink a \"dry shake\" for 30 Seconds.", "Add ice and shake for 8-10 seconds.", "Double strain into coupe or Nick and Nora glass.", "No garnish needed, but lemon peel is a popular choice."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.smallCoupe, .nickAndNora])],
        tip: "Helpful Tips: Many recipes call for simple syrup, so if you want a less tart cocktail try adding .25oz of simple syrup!"
    ),
    Cocktail(
        number: 26, category: .other, name: "Amaretto Sour",
        flavorProfile: "Sweet and Tart, Almond, Creamy, Cherry, Hint of Candy.",
        history: "While Amaretto dates back to the 1500s, it was not popular in the United States until the 1970s. The sweet nutty liquor was a hit, but the amaretto sour was nothing more than a \"joke\" cocktail. However, in 2012 Portland bartender Jeffrey Morgenthaler reconstructed the lost cocktail by adding bourbon and egg white. The cocktail is rapidly growing in popularity and is becoming an instant classic.",
        ingredients: [
            Ingredient(.amaretto, amount: 1.5),
            Ingredient(.bourbon, amount: 0.75),
            Ingredient(.lemonJuice, amount: 1),
            Ingredient(.simpleSyrup, amount: 0.5),
            Ingredient(.eggWhite, amount: 1),
            Ingredient(.lemonPeelOrDarkCharry, amount: 0)
        ],
        instructions: ["Place all ingredients into shaker.", "Place all ingredients into shaker.", "Add ice and shake for 8-10 seconds.", "Add ice or large ice cube to rocks glass.", "Strain your drink into the glass.", "Garnish with a dark cherry and lemon peel."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glass(.rocks)],
        tip: "Fun Tips: Try using over-proofed bourbon (50% ABV or higher) to provide a stronger whiskey presence."
    ),
    Cocktail(
        number: 27, category: .other, name: "Americano",
        flavorProfile: "Bitter, Sweet, Crisp, Refreshing.",
        history: "The Americano was created by barman Gaspare Campari the 1860s at his bar in Milan. The cocktail is low ABV and has soda added to it, so it's easy to drink all day long. The original name for the cocktail was the \"Milano-Torino\" representing the origin countries of Campari (Milan) and sweet vermouth (Torino). Later in the 1920s, American tourists loved the cocktail so much he decided to rename the drink \"Americano.\"",
        ingredients: [
            Ingredient(.campari, amount: 1),
            Ingredient(.sweetVermouth, amount: 1),
            Ingredient(.sodaWater, amount: 0),
            Ingredient(.orangePeelOrWedge, amount: 0)
        ],
        instructions: ["Add ice to your Collins glass.", "Add Campari and sweet vermouth to your glass.", "Top your glass off with soda water.", "Garnish with an orange peel or wedge."],
        supplies: [.jigger, .glass(.collins)],
        tip: "Helpful Tips: This is a classic \"build in your glass\" cocktail. Feel free to give it a stir to mix the ingredients better!"
    ),
    Cocktail(
        number: 28, category: .other, name: "AMF",
        flavorProfile: "Boozy, Sweet, Orange, Citrus.",
        history: "The AMF is a variation of the popular Long Island Iced Tea. The drink often gets a bad rap from people just throwing tons of booze in a pint glass. However, this cocktail, if made correctly, is actually very delicious. The bright blue color makes this a fun pool side or beach cocktail on a hot day.",
        ingredients: [
            Ingredient(.vodka, amount: 0.5),
            Ingredient(.gin, amount: 0.5),
            Ingredient(.rum, amount: 0.5),
            Ingredient(.tequila, amount: 0.5),
            Ingredient(.blueCuracao, amount: 0.5),
            Ingredient(.simpleSyrup, amount: 0.5),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.lemonLimeSoda, amount: 0),
            Ingredient(.lemonWedgeOrCherry, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 8-10 seconds.", "Add ice to your Collins glass.", "Strain cocktail into your glass.", "Top off with lemon/lime soda.", "Garnish with a lemon wedge."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glass(.collins)],
        tip: "Fun Fact: Blue Curacao is just an orange liqueur with blue food coloring added. So, for any drink that includes orange liqueur, you can use Blue Curacao to make your cocktail blue!"
    ),
    Cocktail(
        number: 29, category: .other, name: "Jägerrita",
        flavorProfile: "Jager Herbal, Orange, Tart, Hint of Sweet.",
        history: "Jägermeister margarita? I know what you're thinking... this sounds awful! Famous Portland bartender Jeffrey Morganthaler thought the same thing when his colleague, David Cordoba, introduced this cocktail to him in 2008. Morganthaler was instantly enamored with the cocktail and has been showcasing the drink ever since. The Jägerrita is also gaining popularity online, so give this one a try!",
        ingredients: [
            Ingredient(.jagerMeister, amount: 1.5),
            Ingredient(.orangeLiqueur, amount: 0.75),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.5),
            Ingredient(.limeWheel, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 8-10 seconds.", "Strain into coupe or margarita glass.", "Garnish with a lime wheel.", "* Recipe calls for no ice, but feel free to add some to your drink."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .glasses([.coupe, .margarita])],
        tip: "Fun Tips: This cocktail is also served blended. Simply put the ingredients and a scoop of ice in a blender!"
    ),
    Cocktail(
        number: 30, category: .other, name: "Long Island Iced Tea",
        flavorProfile: "Citrus, Boozy, Orange, Coca Cola.",
        history: "The Long Island Iced Tea was a cocktail created by Robert \"Rosebud\" Butt who worked at the Oak Beach Inn on Long Island, New York. This drink was his entry into a cocktail competition in 1972 where all the cocktails were to feature Triple Sec. The Long Island is extremely popular but gets a bad reputation from people not properly making the cocktail and just pouring loads of booze into a pint glass. When made correctly, the Long Island Iced Tea is a delicious summertime drink.",
        ingredients: [
            Ingredient(.vodka, amount: 0.5),
            Ingredient(.lightRum, amount: 0.5),
            Ingredient(.tequila, amount: 0.5),
            Ingredient(.gin, amount: 0.5),
            Ingredient(.orangeLiqueur, amount: 0.5),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.75),
            Ingredient(.mexicanCoke, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 8-10 seconds.", "Add ice to your Collins glass.", "Strain cocktail into your glass, and top off with cola.", "Garnish with lemon wedge and dark cherry."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .glass(.collins)],
        tip: "Fun Fact: Of course the Long Island has no iced tea, but gets its name from the addition of cola that looks like iced tea!"
    ),
    Cocktail(
        number: 31, category: .other, name: "Pimm’s Cup",
        flavorProfile: "Savory, Herbal, Crisp, Light, Vegetal.",
        history: "The Pimm's cup was created by James Pimm, the owner of the London Oyster Bar in the 1830s as a medicinal health tonic. Today it is the official drink of Wimbledon thanks to its low ABV and refreshing qualities. The drink itself is very simple, but the addition of local fresh fruits and vegetables allow you customize your very own Pimm's Cup every time.",
        ingredients: [
            Ingredient(.pimms1, amount: 2),
            Ingredient(.lemonSoda, amount: 4),
            Ingredient(.cucumber, amount: 0),
            Ingredient(.lemon, amount: 0),
            Ingredient(.strawberries, amount: 0),
            Ingredient(.appleSlices, amount: 0),
            Ingredient(.mint, amount: 0)
        ],
        instructions: ["Using your y-peeler shave ribbons of cucumber and apples.", "Cut up lemon slices and strawberry slices.", "Add fruit and mint into glass.", "Add ice, Pimms #1, lemon soda and lightly stir.", "Garnish with lemon wheel."],
        supplies: [.jigger, .yPeeler, .barKnife, .barSpoon, .glass(.collins)],
        tip: "Fun Tips: Try using tonic water for a more bitter flavor, and try more local fruits and vegetables to make your own custom Pimm's Cup!"
    ),
    Cocktail(
        number: 32, category: .other, name: "Pisco Sour",
        flavorProfile: "Citrus, Frothy, Light, Grape, Fruity.",
        history: "The Pisco Sour was created by American Victor Vaughen Morris who moved to Peru in 1903 and opened the Morris Bar. The cocktail was his alternative to a whiskey sour using the local spirit Pisco, which is a brandy made in Peru. This lighter tasting version of a sour was so popular it made its way around the world and into the US and still a popular cocktail today.",
        ingredients: [
            Ingredient(.pisco, amount: 2),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.75),
            Ingredient(.eggWhite, amount: 1),
            Ingredient(.angosturaBitters, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Give your drink a \"dry shake\" for 30 Seconds.", "Add ice and shake for 8-10 seconds.", "Double strain into glass.", "Garnish with 3-5 drops of Angostura bitters on top."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.stemmed, .rocks])],
        tip: "Helpful Tips: For a more \"frothy\" cocktail try shaking with one large ice cube instead of smaller ice cubes!"
    ),
    Cocktail(
        number: 33, category: .other, name: "Sangria",
        flavorProfile: "Wine, Fruity, Dry, Refreshing, Tannin, Boozy.",
        history: "Sangria was made by early Greeks and Romans who would add spices, sugars, and local fruits and vegetables to their wine. The term \"Sangria\" can be traced back to 18th century Spain, where it has been a staple of the culture. It was introduced to the U.S. at the 1964 World's fair in New York City, and Americans have been thirsty for Sangria ever since! Made in batches you can customize your Sangria with all your favorite fruits and berries.",
        ingredients: [
            Ingredient(.redWine, amount: 2),
            Ingredient(.brandy, amount: 6),
            Ingredient(.oranges, amount: 2),
            Ingredient(.dicedGreenApple, amount: 1),
            Ingredient(.dicedLemon, amount: 1),
            Ingredient(.cinnamonStick, amount: 1),
            Ingredient(.sodaWater, amount: 0)
        ],
        instructions: ["In a pitcher add diced fruit.", "Add juice from 1 orange and 1 cinnamon stick.", "Measure and add ¾ cup of Brandy.", "Add 2 bottles of Spanish red wine.", "Stir with bar spoon and refrigerate for 30 minutes.", "Pour into glass of your choice and top with soda water (optional)."],
        supplies: [.pitcher, .barSpoon, .measuringCups, .juicer],
        tip: "Helpful Tips: Try white wine or rose for a lighter sangria. Also feel free to add your favorite fruits and berries to customize your own sangria!"
    ),
    Cocktail(
        number: 34, category: .other, name: "Surfer on Acid",
        flavorProfile: "Tart, Almond, Jager Herbs, Pineapple.",
        history: "The Surfer on Acid is one of the few cocktails to feature Jägermeister as a key ingredient. It was originally created by Eric Tocesky in the 1990s and included coconut rum and pineapple juice. A delicious pairing, but then I was introduced to Dylan Snyder's reconstruction on the popular YouTube channel Educated Barfly, and it immediately became my favorite version of this cocktail. If you're looking for new ways to use that Jägermeister sitting in your bar, give this one a try!",
        ingredients: [
            Ingredient(.jagerMeister, amount: 1),
            Ingredient(.agedRum, amount: 1),
            Ingredient(.pineappleJuice, amount: 1),
            Ingredient(.orgeatAlmondSyrup, amount: 0.5),
            Ingredient(.limeJuice, amount: 0.5),
            Ingredient(.pineappleFrond, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 8-10 seconds.", "Add ice to Double Old Fashioned .", "Strain your drink into the glass.", "Garnish with a pineapple frond."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glass(.doubleOldFashioned)],
        tip: "Helpful Tips: Jägermeister is a digestif and aids in digestion. It's made with over 56 herbs and spices and features a unique flavor of spice, citrus, licorice, and saffron."
    ),
    Cocktail(
        number: 35, category: .rum, name: "Caipirinha",
        flavorProfile: "Grassy, Tart, Sugary, Banana, Refreshing.",
        history: "The Caipirinha is the national drink ef Brazil and features a very unique type of rum called Cachaça. Most rums are made with molasses, a by-product from the production of sugar. However, Cachaça is made from pure cane juice giving it a grassy-earthy flavor that is unlike any rum you've ever tasted. This was the favorite cocktail of Anthony Bourdain as he loved how funky it was at first, but after a few tastes you'll fall in love with it.",
        ingredients: [
            Ingredient(.cachaca, amount: 2),
            Ingredient(.lime, amount: 1),
            Ingredient(.fineSugar, amount: 0.5)
        ],
        instructions: ["Add quartered lime into double rocks glass.", "Add 1 tablespoon of sugar to glass.", "Muddle limes and sugar together and add Cachaça to glass.", "Add ice, then give a 5 second shake.", "Pour back into glass and add more ice if needed."],
        supplies: [.shaker, .jigger, .muddler, .glass(.doubleRocks)],
        tip: "Helpful Tips: Many recipes calls for a quick stir only, but I prefer a quick shake. Try both and see which you prefer!"
    ),
    Cocktail(
        number: 36, category: .rum, name: "Cuba Libre",
        flavorProfile: "Rum, Cola, Lime.",
        history: "A simple cocktail with a powerful history. The drink was created in 1898 just after the Spanish-America war in Cuba. \"Cuba Libre\" was the call-to-arms meaning \"free Cuba.\" The drink of the day in Cuba was a shot of rum with a squeeze of lime. After the war there was an influx of U.S, imports including Coca Cola. So, one day someone decided to try the rum and squeeze of lime in their Coca Cola, and the iconic drink was created. However, today's version is cocaine free of course!",
        ingredients: [
            Ingredient(.whiteRum, amount: 2),
            Ingredient(.limeJuice, amount: 0.5),
            Ingredient(.mexicanCoke, amount: 0),
            Ingredient(.limeWedge, amount: 0)
        ],
        instructions: ["Place ice into glass.", "Add rum and squeezed lime juice.", "Top glass off with Coca Cola.", "Use bar spoon for quick stir.", "Garnish with a wedge of lime."],
        supplies: [.jigger, .barSpoon, .glasses([.collins, .rocks])],
        tip: "Fun Tips: Mexican Coca-Coca, recognized by the signature bottles, are made with real sugar, and preferred over canned Cola made with corn syrup."
    ),
    Cocktail(
        number: 37, category: .rum, name: "Daiquiri",
        flavorProfile: "Citrus, Grassy, Sugar, Refreshing.",
        history: "The Daiquiri is often referred to as a bartender's \"Air-Conditioning\" drink. It gets its roots from Cuba, and there is no known record of who created it or when it was first made. However, during the Spanish-American war, many Americans stationed in Cuba learned about this cocktail and it inevitably made its way to America. In the early 1900s the drink was introduced to the U.S. Navy as another way to fight off scurvy, and it's been a hit ever since,",
        ingredients: [
            Ingredient(.rum, amount: 2),
            Ingredient(.simpleSyrup, amount: 1),
            Ingredient(.limeJuice, amount: 1),
            Ingredient(.limeWheel, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into glass.", "Garnish with lime wheel."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .martini])],
        tip: "Helpful Tips: The Daiquiri is typically made with light rum, but try it with your favorite aged rum for a more complex cocktail!"
    ),
    Cocktail(
        number: 38, category: .rum, name: "Dark N’ Stormy",
        flavorProfile: "Spicey, Ginger, Citrus, Dry, Hint of Sweet.",
        history: "The Dark N' Stormy gets its origins in Bermuda at a ginger beer factory that was run by a Naval Officers Club just after WWI. At one point they discovered the wonderful pairing of Goslings black rum and ginger beer. It got its name from the color of the drink representing \"a cloud no fool or dead man would sail under.\" Goslings then patented the cocktail name, and now if you drink a Dark N° Stormy with any other rum, no matter how delicious it might be (wink wink), you'd be breaking the law!",
        ingredients: [
            Ingredient(.darkRum, amount: 2),
            Ingredient(.limeJuice, amount: 0.5),
            Ingredient(.gingerBeer, amount: 0),
            Ingredient(.limeWedge, amount: 0)
        ],
        instructions: ["Place rum and lime juice into glass.", "Add ice to glass and top glass off with ginger beer.", "Give a light stir with bar spoon.", "Garnish with lime wedge.", "(Optional) Add 5 dashes of Angostura bitters on top."],
        supplies: [.jigger, .barSpoon, .juicer, .glasses([.collins, .rocks])],
        tip: "Helpful Tips: Your ginger beer plays a huge part in this cocktail. Try getting a ginger-spice forward brand and avoid ones with high fructose corn syrup."
    ),
    Cocktail(
        number: 39, category: .rum, name: "El Presidente",
        flavorProfile: "Orange, Dry, Hint of Burnt Sugar, Light.",
        history: "The El Presidente came from Cuba during the Prohibition era in America. It is believed American Eddie Wolke created this cocktail while bartending at The Jockey Club in Havana, Cuba after fleeing the U.S. looking for work. If that is correct, then the cocktail would most likely be named after the president of Cuba at the time Gerardo Machado. This easy drinking cocktail is the perfect pre-dinner drink, and a must try for all rum lovers.",
        ingredients: [
            Ingredient(.agedRum, amount: 1.5),
            Ingredient(.blancVermouth, amount: 1.5),
            Ingredient(.dryCurcacao, amount: 0.25),
            Ingredient(.grenadine, amount: 1),
            Ingredient(.orangePeel, amount: 0)
        ],
        instructions: ["Place all ingredients into mixing glass.", "Add ice and stir for 30 seconds.", "Strain into your glass.", "Garnish with an orange peel."],
        supplies: [.mixingGlass, .hawthorneStrainer, .fineStrainer, .jigger, .glasses([.coupe, .nickAndNora])],
        tip: "Fun Tips: Vermouth is fortified wine, So, it must be refrigerated and consumed within a few months."
    ),
    Cocktail(
        number: 40, category: .rum, name: "Hemingway Daiquiri",
        flavorProfile: "Tart, Cherry, Maraschino, Bitter, Crisp.",
        history: "As you might be able to guess this cocktail was created for Ernest Hemingway himself. Hemingway had his first daiquiri at La Floridita in Havana, Cuba. He remarked: \"That's good but I'd prefer mine with twice as much rum and no sugar.\" Over time the daiquiri left out the sugar but added in maraschino and grapefruit for a more balanced flavor, Of course, the cocktail got so popular they eventually named it the Hemingway Daiquiri,",
        ingredients: [
            Ingredient(.whiteRum, amount: 1.5),
            Ingredient(.maraschino, amount: 0.5),
            Ingredient(.grapefruitJucie, amount: 1),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.limeWheel, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into coupe or martini glass.", "Garnish with a lime wheel."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .martini])],
        tip: "Helpful Tips: Hemingway wasn't a fan, but if you'd like the drink to be a little sweeter add .5oz of simple syrup!"
    ),
    Cocktail(
        number: 41, category: .rum, name: "Hot Buttered Rum",
        flavorProfile: "Spiced, Butter, Vanilla, Rich, Creamy.",
        history: "Adding spices and warming up alcoholic beverages goes back many years in European tradition, and of course that tradition was brought to America by Colonists. Now we think of Hot Buttered Rum as a holiday staple as it keeps up warm during the cold winter nights and we even refer to the taste as \"tasting like Christmas.\" If you haven't tried it yet, it's well worth the effort!",
        ingredients: [
            Ingredient(.saltedButter, amount: 113),
            Ingredient(.brownSugar, amount: 4),
            Ingredient(.groundNutmegCinnamonAndClove, amount: 0.25),
            Ingredient(.vanillaIceCream, amount: 2),
            Ingredient(.spicedRum, amount: 2),
            Ingredient(.hotButteredBatter, amount: 2),
            Ingredient(.hotWater, amount: 4),
            Ingredient(.groundNutmeg, amount: 0)
        ],
        instructions: ["In a large bowl thoroughly mix together everything in the batter recipe using a whisk, spoon or fork.", "Add two scoops of batter into heat proof glass.", "Add rum and hot water to glass.", "Stir until completely dissolved.", "Garnish with fresh ground nutmeg."],
        supplies: [],
        tip: "Fun Tips: Your batter should be made to taste, so try different amounts of spices to get your favorite mix! Store in freezer or fridge,"
    ),
    Cocktail(
        number: 42, category: .rum, name: "Hurricane",
        flavorProfile: "Citrus, Passionfruit, Sweetness, Molasses.",
        history: "The Hurricane is a fruity, boozy New Orleans classic that many claim was first served at the World's Fair in 1939 at the Hurricane Bar. However, most historians believe it was created in the mid-1940s at Pat O'Brien's Bar in New Orleans after WWII, when there was a shortage of whiskey and brandy but a surplus of rum. Either way, the Hurricane is a New Orleans staple, and a favorite of tourists,",
        ingredients: [
            Ingredient(.lightRum, amount: 2),
            Ingredient(.darkSpicedRum, amount: 2),
            Ingredient(.lemonJuice, amount: 2),
            Ingredient(.passionfruitSyrup, amount: 2),
            Ingredient(.cherryAndOrangeSlice, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "(Optional) Place ice in Lewis bag and pound ice to crush.", "Add ice to shaker and shake your", "Pour all contents of shaker into glass and top with ice if needed.", "Garnish with orange slice and cherry."],
        supplies: [.shaker, .jigger, .juicer, .lewisBag, .glass(.hurricane)],
        tip: "Passionfruit Syrup Recipe: 1;1 Ratio of passion fruit pure and simple syrup. You can also find passion fruit syrups online,"
    ),
    Cocktail(
        number: 43, category: .rum, name: "Jungle Bird",
        flavorProfile: "Bitter, Citrus, Pineapple, Sweet, Frothy.",
        history: "The Jungle Bird was created in 1978 at the Aviary Bar in Kuala Lumpor, Malaysia, This is a rare tiki cocktail that features Campari, which is a bitter liqueur that is featured in the Negroni and Boulevardier. The Aviary is located in the Hilton hotel, and this cocktail was originally made to welcome guests and was served in a glass shaped like a bird. Now it has become a tiki classic around the world.",
        ingredients: [
            Ingredient(.darkRum, amount: 2),
            Ingredient(.campari, amount: 0.75),
            Ingredient(.pineappleJuice, amount: 1.5),
            Ingredient(.simpleSyrup, amount: 0.5),
            Ingredient(.limeJuice, amount: 0.5),
            Ingredient(.pineappleFrond, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Add Ice to your glass.", "Strain drink into glass.", "Garnish with pineapple fronds."],
        supplies: [.shaker, .strainer, .juicer, .lewisBag, .glasses([.rocks, .collins, .tiki])],
        tip: "Helpful Tips: Pineapple juice helps create a wonderful froth on top. Want more froth? Shake it longer!"
    ),
    Cocktail(
        number: 44, category: .rum, name: "Mai Tai",
        flavorProfile: "Tart, Almond, Pineapple, Orange.",
        history: "The Mai Tai is assumed to be created by Victor \"Trader Vic\" Bergeron in 1944 in Oakland, California at his restaurant Trader Vic's. However, his rival at the time Don the Beachcomber claimed he created the cocktail at his self-named restaurant in Hollywood in 1933. Either way, Traders Vic's version is the most used version of this cocktail. The Mai Tai is the king of tiki cocktails, and still the drink of choice in Hawaii,",
        ingredients: [
            Ingredient(.agedRum, amount: 2),
            Ingredient(.orangeLiqueur, amount: 0.5),
            Ingredient(.orgeatSyrup, amount: 0.5),
            Ingredient(.limeJuice, amount: 1),
            Ingredient(.simpleSyrup, amount: 0.25),
            Ingredient(.halfLimeAndMint, amount: 0)
        ],
        instructions: ["Place all ingredients into shaker (save ½ of squeezed lime).", "Add ice to shaker and shake your drink for 8-10 seconds.", "Add ice to double rocks glass.", "Strain drink into glass.", "Garnish with half squeeze-lime and mint sprig."],
        supplies: [.shaker, .strainer, .jigger, .juicer, .glass(.doubleRocks)],
        tip: "Helpful Tips: Use crushed ice for a more tiki style, Orgeat is available on Amazon."
    ),
    Cocktail(
        number: 45, category: .rum, name: "Mojito",
        flavorProfile: "Minty, Citrus, Sweet, Crisp, Light.",
        history: "The Mojito is the official drink of Cuba and some believe the drink was made with Cuban moonshine early on. Then in the 1500s Cuba was invaded by pirates, and they used the cocktail as a medicinal way to fight scurvy, but of course adding rum to the mix. The cocktail gained popularity at the La Bodeguita as it was a favorite cocktail of Ernest Hemingway, It has been featured in James Bonds movies and is now an iconic cocktail.",
        ingredients: [
            Ingredient(.whiteRum, amount: 2),
            Ingredient(.lime, amount: 0.5),
            Ingredient(.demeraraSugar, amount: 0.5),
            Ingredient(.mint, amount: 9),
            Ingredient(.sodaWater, amount: 0),
            Ingredient(.limeWheelAndMintSprig, amount: 0)
        ],
        instructions: ["Add quartered lime into glass.", "Add rest of the ingredients to glass (slap mint with hands).", "Lightly muddle everything in glass.", "Add ice, top with soda water and stir to mix everything together.", "Slide lime wheels into glass and garnish with mint sprig."],
        supplies: [.barSpoon, .jigger, .muddler, .lewisBag, .glass(.collins)],
        tip: "Helpful Tips: When stirring your mojito only fill glass about 75% full, give it a good stir then top it off with more ice and soda water!"
    ),
    Cocktail(
        number: 46, category: .rum, name: "Pain Killer",
        flavorProfile: "Creamy, Pineapple, Nutmeg, Rich, Coconut.",
        history: "The Painkiller was created in the 1970s by Daphne Henderson at the Soggy Dollar Bar in the Virgins Islands. The bar is a paradise for sailors and named by its patrons having to leave their sail boats and wade to land to get access to the bar. Later on, Pusser's Rum patented the cocktail name, and must be used in all Painkillers. If you don't have any around, you can use any aged rum and it will taste great, but you are no longer drinking a Painkiller anymore! (wink, wink)",
        ingredients: [
            Ingredient(.pussersRum, amount: 2.5),
            Ingredient(.pineappleJuice, amount: 1.5),
            Ingredient(.cremeOfCoconut, amount: 1),
            Ingredient(.orangeJuice, amount: 0.5),
            Ingredient(.pineappleFrondsAndGroundNutmeg, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Add ice to double rocks glass.", "Strain drink into glass.", "Garnish with a pineapple fronds & ground nutmeg."],
        supplies: [.shaker, .strainer, .jigger, .microplane, .glass(.doubleRocks)],
        tip: "Fun Facts: The Painkiller at the Soggy Dollar Bar has four variations: 1,2,3,4 representing how many shots of rum will come in your cocktail!"
    ),
    Cocktail(
        number: 47, category: .rum, name: "Piña Colada",
        flavorProfile: "Pineapple, Coconut, Rich, Creamy.",
        history: "The Piña Colada creation is credited to Ramon \"Monchito\" Perez at the Caribe Hilton in San Juan Puerto Rico in 1954. However, the mixing of pineapple, coconuts, and rum has been going on for many years prior. Mostly known for cruise line and vacation cocktails, the Piña Colada is also the national drink of Puerto Rico. This simple three ingredient cocktail has become a warm weather favorite all around the world,",
        ingredients: [
            Ingredient(.whiteRum, amount: 2),
            Ingredient(.cremeOfCoconut, amount: 1.5),
            Ingredient(.pineappleJuice, amount: 2),
            Ingredient(.pineappleWedgeAndCherry, amount: 0)
        ],
        instructions: ["Add ingredients to your glass.", "Fill glass with ice to top.", "Pour ice and ingredients into blender.", "Blend for 8-12 seconds.", "Pour back into Hurricane glass.", "Garnish with pineapple wedge and cherry."],
        supplies: [.blender, .jigger, .glass(.hurricane)],
        tip: "Helpful Tips: Don't have a blender? You can also make this cocktail by shaking it and serving it over ice!"
    ),
    Cocktail(
        number: 48, category: .rum, name: "Spanish Coffee",
        flavorProfile: "Coffee, Sweet, Orange, Spice, Cinnamon, Cream.",
        history: "The Spanish Coffee was created in the 1970s at the historic Huber's Café in Portland, Oregon. Widely considered a \"nightcap\" or end-of-the-night cocktail, it really is an all-day drink since it does include coffee. This cocktail involves lighting liquid on fire to caramelize the rim of the glass so be extra cautious! Keep in mind, you can make this cocktail without the fire and it will still taste delicious!",
        ingredients: [
            Ingredient(.rum151, amount: 0.75),
            Ingredient(.orangeLiqueur, amount: 0.25),
            Ingredient(.kahlua, amount: 1.5),
            Ingredient(.coffee, amount: 0),
            Ingredient(.heavyCreamAndNutmeg, amount: 0),
            Ingredient(.sugarRim, amount: 0),
            Ingredient(.lime, amount: 0)
        ],
        instructions: ["Place sugar rim on heat-treated glass.", "Add rum and orange liqueur to glass.", "Tilt glass at angle and light rum on fire to caramelize rim. (slowly rotating, and not touching the hot part of the glass)", "Cover top of glass with plate to extinguish fire.", "Add Kahlua and coffee to glass.", "Garnish with heavy cream and nutmeg."],
        supplies: [.jigger, .barSpoon, .longLighterOrMatch, .coffeeCup],
        tip: "Helpful Tips: Add your heavy cream to a container and shake it until it thickens, adding a whipped cream consistency to your cocktail!"
    ),
    Cocktail(
        number: 49, category: .scotch, name: "Blood & Sand",
        flavorProfile: "Orange, Cherry, Sweet, Smokey, Herbal.",
        history: "The Blood and Sand was created for the premier of the movie \"Blood and Sand\" in 1922. Harry Craddock then put the cocktail into his Savoy Cocktail Book in 1930. Much like scotch itself, the cocktail is rather polarizing in its popularity. The Blood and Sand has a very unique taste that many love and others equally dislike. You will often find it made with an American Single-Malt Scotch as \"less peaty\" scotches work best in this cocktail.",
        ingredients: [
            Ingredient(.blendedScotch, amount: 0.75),
            Ingredient(.sweetVermouth, amount: 0.75),
            Ingredient(.cherryHeering, amount: 0.75),
            Ingredient(.orangeJuice, amount: 0.75),
            Ingredient(.orangePeelOrCherry, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into coupe or martini glass.", "Garnish with an orange peel or cherry."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .glasses([.coupe, .martini])],
        tip: "Some bartenders make this cocktail with pineapple juice instead of orange juice. Give it a try and see which one you like most!"
    ),
    Cocktail(
        number: 50, category: .scotch, name: "Penicillin",
        flavorProfile: "Tart, Smokey, Ginger, Honey, Hint of Sweet.",
        history: "The Penicillin is a modern classic cocktail created by Sam Ross while bartending at the famous Milk & Honey Bar in New York City. Rarely does a scotch cocktail gain so much popularity, but the Penicillin has become a popular drink around the world and published in many recent cocktail books. You also get to garnish it with candied ginger, and who doesn't love that?",
        ingredients: [
            Ingredient(.blendedScotch, amount: 2),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.honeySyrup, amount: 0.5),
            Ingredient(.gingerSyrup, amount: 0.5),
            Ingredient(.islayScotchFloat, amount: 0),
            Ingredient(.candiedGinger, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Add ice or large ice cube to rocks glass and double strain your drink into glass.", "Place a spoon into the glass and lean against the edge. Gently pour Islay Scotch over the back of the spoon. Because of the different densities of the liquids, the Islay malt will float to the top.", "Garnish with candied ginger."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glass(.rocks)],
        tip: "Quick Ginger Syrup Recipe: 1 cup hot water, 1 cup sugar, 1 cup chopped ginger in blender. Blend and strain with cheesecloth. Bottle and refrigerate."
    ),
    Cocktail(
        number: 51, category: .scotch, name: "Rob Roy",
        flavorProfile: "Smokey, Sweet, Savory, Smooth.",
        history: "The Rob Roy was first created at the Waldorf Hotel in 1895. The cocktail was created to celebrate the premiere of the highly anticipated opera about the Scottish hero Robert Roy MacGregor. Closely related to the popular Manhattan cocktail, the only difference is the Rob Roy replaces the whiskey with scotch giving it a more smoky flavor.",
        ingredients: [
            Ingredient(.blendedScotch, amount: 2),
            Ingredient(.sweetVermouth, amount: 1),
            Ingredient(.angosturaBitters, amount: 2),
            Ingredient(.cherry, amount: 0)
        ],
        instructions: ["Place all ingredients into mixing glass.", "Add ice and stir for 30 seconds.", "Strain cocktail into coupe or martini glass.", "Garnish with cherry or orange peel."],
        supplies: [.mixingGlass, .barSpoon, .hawthorneStrainer, .glasses([.coupe, .martini])],
        tip: "Fun Tips: To make a \"perfect\" Rob Roy use .5oz (15ml) of sweet vermouth and .5oz (15ml) of dry vermouth, See which one you like best!"
    ),
    Cocktail(
        number: 52, category: .scotch, name: "Rusty Nail",
        flavorProfile: "Smokey, Sweet, Honey, Spicey, Herbal.",
        history: "The Rusty Nail made its first official appearance in 1937 at the British Industries Fair but under the name of B.I.F. The cocktail was not popular, and slowly disappeared. Then out of nowhere the cocktail moved to the states in 1950s and became a huge hit. Then in the 1960s the bartenders at \"21 Club\" in Manhattan gave the cocktail the name Rusty Nail. It features Drambuie, a scotch-based liqueur with spices, honey, and herbs.",
        ingredients: [
            Ingredient(.blendedScotch, amount: 2),
            Ingredient(.drambuie, amount: 0.75),
            Ingredient(.angosturaBitters, amount: 2),
            Ingredient(.lemonTwist, amount: 0)
        ],
        instructions: ["Add Ice to rocks glass.", "Add scotch and Drambuie to glass.", "(optional) For spicier cocktail add 2 dashes of bitters.", "Stir cocktail in glass for about 20 seconds.", "No garnish needed, but optional lemon peel for citrus."],
        supplies: [.jigger, .barSpoon, .glass(.rocks)],
        tip: "Helpful Tips: Drambuie is very sweet, so try more or less in your drink to find what best works for your palette!"
    ),
    Cocktail(
        number: 53, category: .sparklingWine, name: "Aperol Spritz",
        flavorProfile: "Bitter, Orange, Dry, Crisp, Refreshing.",
        history: "The practice of a \"spritz\" dates back to the early 1800s and Aperol dates back to 1919. Aperol was marketed as a health conscience liqueur because of its low alcohol volume. Then in the 1950s Aperol started to capitalize on the \"spritz\" so they could market their product to sporty, health conscience consumers. In 2003 Campari bought Aperol, and the cocktail instantly became a hit all around the world.",
        ingredients: [
            Ingredient(.aperol, amount: 2),
            Ingredient(.prosecco, amount: 2),
            Ingredient(.sodaWater, amount: 1),
            Ingredient(.orangeWedgeOrTwist, amount: 0)
        ],
        instructions: ["Add all ingredients into a large wine glass.", "Add ice to glass to preference.", "Lightly stir for 15 seconds.", "Garnish with orange wedge or twist."],
        supplies: [.jigger, .barSpoon, .glass(.wine)],
        tip: "Helpful Tips: How sweet vour prosecco is plays a role in this cocktail. As confusing as it might be a \"dry\" Prosecco is most Sweet, and a \"Brut\" is actually the driest!"
    ),
    Cocktail(
        number: 54, category: .sparklingWine, name: "Champagne Cocktail",
        flavorProfile: "Dry, Slightly Sweet, Herbal, Crisp.",
        history: "The Champagne Cocktail dates back to the early 1800s but was first recorded in 1850 in San Francisco. The cocktail was a huge hit, and often the drink of choice for how easy it was to consume. In 1895 Joseph Haywood made a variation where he adds brandy and both versions are still very popular today.",
        ingredients: [
            Ingredient(.brandy, amount: 0.5),
            Ingredient(.sugarCube, amount: 1.0),
            Ingredient(.angosturaBitters, amount: 2.0),
            Ingredient(.lemonPeel, amount: 0.0),
            Ingredient(.champagne, amount: 0)
        ],
        instructions: ["(optional) Add brandy to glass.", "Fill your glass with champagne.", "Place sugar cube on bar spoon and cover with 2 dashes of bitters.", "Drop sugar cube into glass.", "Garnish with lemon peel (optional)."],
        supplies: [.barSpoon, .glasses([.champagneFlute, .coupe])],
        tip: "Helpful Tips: You might be tempted to stir this cocktail, but the bitters and sugar cube is more for the bubble effect it creates in the glass!"
    ),
    Cocktail(
        number: 55, category: .sparklingWine, name: "French 75",
        flavorProfile: "Citrus, Herbal, Crisp, Refreshing, Light.",
        history: "The French 75 is likely created by Harry MacElhone at Harry's American Bar in Paris in 1926. The cocktail was said to give you such a kick it felt like getting hit by a Howitzer 75mm Field Gun used during WWI, hence the name French 75. It has become a staple cocktail in New Orleans and one of the most popular cocktails around the world.",
        ingredients: [
            Ingredient(.gin, amount: 1.0),
            Ingredient(.lemonJuice, amount: 5.0),
            Ingredient(.simpleSyrup, amount: 5.0),
            Ingredient(.champagne, amount: 0.0),
            Ingredient(.lemonTwist, amount: 0.0)
        ],
        instructions: ["Add gin, lemon juice, and simple syrup to shaker.", "Add ice and shake for 8-10 seconds.", "Strain into champagne flute.", "Add champagne to fill glass.", "Garnish with lemon twist."],
        supplies: [.shaker, .strainer, .juicer, .glasses([.champagneFlute])],
        tip: "Helpful Tips: Try an Elderflower French 75 by replacing the simple syrup with St. Germain!"
    ),
    Cocktail(
        number: 56, category: .sparklingWine, name: "Mimosa",
        flavorProfile: "Orange, Light, Crisp, Refreshing.",
        history: "The Mimosa is thought to be created in 1925 by Frank Meier at the Ritz Hotel in Paris. However, the Mimosa is a riff on a Buck's fizz created in 1921. The Buck's fizz is served with no ice with a heavier pour on champagne versus the mimosa which is equal parts and served over ice. It is very likely you have been drinking Buck Fizzes all along!",
        ingredients: [
            Ingredient(.champagne, amount: 3.0),
            Ingredient(.orangeJuice, amount: 3.0)
        ],
        instructions: ["Pour champagne into glass.", "Add orange juice to glass (to taste).", "(optional) Add ice to drink.", "Garnish with an orange wedge."],
        supplies: [.jigger, .glasses([.wine, .champagneFlute])],
        tip: "Fun Tips: Add fresh berries to your drink to up the presentation and add a slight berry flavor!"
    ),
    Cocktail(
        number: 57, category: .sparklingWine, name: "Peach Bellini",
        flavorProfile: "Peach, Sweet, Light, Refreshing, Dry.",
        history: "The Bellini was created in the 1940s by Guiseppi Cipriani at Harry's Bar in Venice, Italy. The unique pink color of the cocktail reminded Cipriani of one of his favorite paintings by Giovanni Bellini, giving the cocktail its name. This is a simple cocktail and wonderful summertime drink to take advantage of peach season.",
        ingredients: [
            Ingredient(.peachPuree, amount: 2),
            Ingredient(.prosecco, amount: 3.0),
            Ingredient(.sliceOfPeach, amount: 0)
        ],
        instructions: ["Blanche peaches for one minute in boiling water.", "Remove skin from peaches and remove pit.", "Place in blender and blend until smooth.", "Add simple syrup to taste and preference.", "Chill peach puree.", "Add puree to champagne flute.", "Add prosecco to glass.", "Lightly stir for 10 seconds.", "Garnish with slice of peach."],
        supplies: [.glasses([.champagneFlute, .wine])],
        tip: "Fun Tips: Try different purees with your favorite fruits and berries!"
    ),
    Cocktail(
        number: 58, category: .tequila, name: "Elder Smoke",
        flavorProfile: "Smokey, Elderflower, Citrus, Grapefruit, Cranberry.",
        history: "The Elder Smoke is a Cocktail Cards original cocktail created by AJ Rant in 2017 while working at Sand Point Grill in Seattle. The cocktail was created for regulars who kept requesting something smoky with grapefruit while using their favorite spirit of tequila. The cocktail did not have a name at the time but was requested so much I had to put it in the Cocktail Card set!",
        ingredients: [
            Ingredient(.blancoTequila, amount: 1.5),
            Ingredient(.blendedScotch, amount: 0.5),
            Ingredient(.stGermain, amount: 0.75),
            Ingredient(.limeJuice, amount: 0.5),
            Ingredient(.grapefruitJucie, amount: 0.5),
            Ingredient(.cranberryJuice, amount: 0.5),
            Ingredient(.grapefruitPeel, amount: 0)
        ],
        instructions: ["Put all ingredients except cranberry into shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Add ice or large ice cube to rocks glass and strain cocktail into glass.", "Pour in cranberry juice near the edge of the glass.", "Garnish with grapefruit peel."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glasses([.rocks])],
        tip: "Helpful Tips: Instead of scotch trying using a mezcal, and see which version you like best!"
    ),
    Cocktail(
        number: 59, category: .tequila, name: "Margarita",
        flavorProfile: "Agave, Citrus, Sweet, Orange, Refreshing.",
        history: "The Margarita is one of the most well-known cocktails in the world, and many people try to claim credit for the iconic cocktail. The earliest story is that it was created in 1938 by Carlos \"Danny\" Herrera at his restaurant Rancho La Gloria near Tijuana. He claimed he created it for a picky guest who claimed to be allergic to all alcohol besides tequila, but she did not like to drink the spirit straight. Herrera worked around the typical tequila shot and utilized salt and limes to create a desirable cocktail.",
        ingredients: [
            Ingredient(.tequila, amount: 2.0),
            Ingredient(.tripleSec, amount: 1),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.lemonJuice, amount: 0.25),
            Ingredient(.simpleSyrup, amount: 0.25),
            Ingredient(.limeWedge, amount: 0.0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Salt rim of glass using lime wedge and salt.", "Add ice to glass.", "Strain cocktail into glass."],
        supplies: [.shaker, .strainer, .jigger, .juicer, .glasses([.margarita, .doubleRocks])],
        tip: "Fun Facts: Add fruit or jalapenos for flavored margaritas. Also popular as a blended cocktail."
    ),
    Cocktail(
        number: 60, category: .tequila, name: "Matador",
        flavorProfile: "Citrus, Herbal, Pineapple, Agave, Refreshing.",
        history: "The Matador is a lesser-known tequila cocktail that has been through many different variations. The earliest record dates to 1937 when it appeared in the Café Royal Cocktail Book written by William J. Tarling. Trader Vic brought the addition of pineapple juice, and still the most popular version of this cocktail. Over time newer versions have added agave and green chartreuse.",
        ingredients: [
            Ingredient(.tequila, amount: 1.5),
            Ingredient(.pineappleJuice, amount: 1.0),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.greenChartreuse, amount: 0.25),
            Ingredient(.agave, amount: 1),
            Ingredient(.pineappleFrond, amount: 0.0),
            Ingredient(.limeWheel, amount: 0.0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Add ice to glass.", "Strain drink into glass.", "Garnish with pineapple fronds and lime wheel."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glasses([.collins, .doubleRocks])],
        tip: "More Common Matador Recipe: 1.5oz Tequila, 3oz Pineapple Juice, and .5oz Lime juice."
    ),
    Cocktail(
        number: 61, category: .tequila, name: "Paloma",
        flavorProfile: "Citrus, Grapefruit, Agave, Bitter, Refreshing.",
        history: "The Paloma has a very hazy history, but the person who gets the most credit for the cocktail is legendary Don Javier Delgado Carona, owner of La Capilla in Tequila, Mexico. Often times you will see the Paloma made with Squirt or grapefruit soda, but utilizing fresh grapefruit juice has turned this cocktail into worldwide favorite.",
        ingredients: [
            Ingredient(.tequila, amount: 1.5),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.5),
            Ingredient(.grapefruitJucie, amount: 1.5),
            Ingredient(.sodaWater, amount: 0.0),
            Ingredient(.limeWedge, amount: 0.0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Add ice to glass.", "Strain cocktail into glass.", "Top drink with soda water and garnish with lime wedge."],
        supplies: [.shaker, .hawthorneStrainer, .juicer, .glasses([.doubleRocks])],
        tip: "Fun Tip: Instead of grapefruit juice try using your favorite grapefruit soda and see which version you like most!"
    ),
    Cocktail(
        number: 62, category: .tequila, name: "Tequila Sunrise",
        flavorProfile: "Orange, Sweet, Pomegranate, Agave.",
        history: "The Tequila Sunrise you see today is far from the original created in the late 30s. It originated from a cocktail containing creme de cassis and lime juice. But today's version took a turn and now uses orange juice and grenadine. The Tequila Sunrise was the favorite cocktail of the legendary rock band the Rolling Stones, and they would order it everywhere they went.",
        ingredients: [
            Ingredient(.tequila, amount: 2.0),
            Ingredient(.orangeJuice, amount: 4.0),
            Ingredient(.grenadine, amount: 0.25),
            Ingredient(.orangeSlices, amount: 0.0)
        ],
        instructions: ["Add Tequila and Orange Juice to shaker.", "Add Ice to Shaker and shake your drink for 8-10 Seconds.", "Add grenadine to bottom of Collins glass.", "Add ice to glass and strain cocktail.", "Using a bar spoon lightly stir.", "Garnish with Orange Slice."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .barSpoon, .glasses([.collins])],
        tip: "Grenadine Recipe: 2 cups pomegranate juice, 2 cups sugar, ¼ cup pomegranate molasses, 1 tsp orange flower water, 15ml vodka. Stir in pot on low heat and bottle."
    ),
    Cocktail(
        number: 63, category: .tequila, name: "Tequila Old Fashioned",
        flavorProfile: "Smokey, Sweet, Agave, Spice, Orange.",
        history: "This modern take on the extremely popular Old Fashioned cocktail features tequila and mezcal. It was created by Phil Ward while bartending at the iconic Death & Company Bar in New York City. Mezcal was not found in many cocktails, but this recipe inspired countless cocktails to follow featuring the smokier tequila spirit.",
        ingredients: [
            Ingredient(.reposadoTequila, amount: 1.5),
            Ingredient(.mezcal, amount: 0.5),
            Ingredient(.agave, amount: 1.0),
            Ingredient(.angosturaBitters, amount: 2.0),
            Ingredient(.orangeWedgeOrTwist, amount: 0.0)
        ],
        instructions: ["Add all ingredients into mixing glass.", "Add ice and stir for 30 seconds.", "Add ice or large ice cube to rocks glass.", "Strain drink into glass.", "Garnish with orange peel."],
        supplies: [.mixingGlass, .hawthorneStrainer, .jigger, .barSpoon, .glasses([.rocks])],
        tip: "Helpful Tips: Try using some different bitters as well such as mole or chocolate bitters!"
    ),
    Cocktail(
        number: 64, category: .tequila, name: "Tequila Smash",
        flavorProfile: "Citrus, Mint, Agave, Fruity.",
        history: "The smash is an ancient cocktail template that can really apply to any type of spirit. Jerry Thomas was the first to record a smash in 1862 in his book How to Mix Drinks. A \"smash\" is simply adding mint and sugar to a spirit and the addition of seasonal fruits or berries. So, use this template to master your perfect Tequila Smash!",
        ingredients: [
            Ingredient(.tequila, amount: 1.5),
            Ingredient(.orangeLiqueur, amount: 0.5),
            Ingredient(.lemon, amount: 1.0),
            Ingredient(.agaveNectar, amount: 5),
            Ingredient(.mint, amount: 7.0)
        ],
        instructions: ["Add all ingredients into a shaker.", "Use muddler to lightly press on lemons and mint.", "(optional) Place ice in Lewis bag and crush ice.", "Add small amount of ice to shaker and give a light shake for 10 seconds.", "Pour everything into double rocks glass, and top off with ice."],
        supplies: [.shaker, .jigger, .muddler, .lewisBag, .glasses([.doubleRocks])],
        tip: "Drink Tip: peaches, cucumbers, blackberries, or strawberries!"
    ),
    Cocktail(
        number: 65, category: .vodka, name: "Appletini",
        flavorProfile: "Apple, Tart, Citrus, Semi-Sweet.",
        history: "The Appletini was invented in the late 90s at Lola's, an iconic West Hollywood Bar. It paved the way for many fruity and sweet cocktails that ended in \"tini.\" The cocktail has been featured in a few movies but recently gained popularity for being the favorite cocktail of J.D. on the TV series Scrubs.",
        ingredients: [
            Ingredient(.vodka, amount: 1.5),
            Ingredient(.greenAppleSchnapps, amount: 0.75),
            Ingredient(.limeJuice, amount: 0.5),
            Ingredient(.orangeLiqueur, amount: 0.25),
            Ingredient(.appleSliceOrCherry, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 8-10 seconds.", "Double strain into coupe or martini glass.", "Garnish with apple slice or cherry."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .martini])],
        tip: "Helpful Tips: Want a more red apple style cocktail? Try adding .75 oz of cranberry!"
    ),
    Cocktail(
        number: 66, category: .vodka, name: "Bay Breeze",
        flavorProfile: "Cranberry, Pineapple, Fruity, Sweet, Light.",
        history: "The Bay Breeze is a modification to the popular Cade Codder. The cocktail originated in Hawaii and is sometimes also called a Downeaster, Hawaiian Sea Breeze, or a Paul Joseph. This fruity cocktail is the perfect warm weather sipper and a favorite for those vacationing in Hawaii.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.pineappleJuice, amount: 4.0),
            Ingredient(.cranberryJuice, amount: 1.5),
            Ingredient(.limeWedge, amount: 0.0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 8-10 seconds.", "Add ice to glass and strain drink into glass.", "Garnish with a lime wedge."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .glasses([.collins, .doubleRocks])],
        tip: "Fun Tips: Most of the time this drink is just poured into a glass, but I like to shake it as the pineapple juice froths up and creates a great consistency."
    ),
    Cocktail(
        number: 67, category: .vodka, name: "Black Russian",
        flavorProfile: "Coffee, Sweet, Strong, Bitter.",
        history: "The Black Russian was first made by barman Gustave Tops at Hotel Metropole in Brussels in the late 1940s. The cocktail was made for Perle Mesta who was a social icon and the American ambassador to Luxembourg. This was around the beginning of the cold war, so the idea was to use Russian vodka and make it dark and gloomy, also giving the cocktail its name.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.kahlua, amount: 1.0)
        ],
        instructions: ["Add ingredients to rocks glass.", "Add Ice to rocks glass.", "Use bar spoon and lightly stir for 10 seconds."],
        supplies: [.barSpoon, .glasses([.rocks])],
        tip: "Fun Tips: Kahlua is the primary flavor, so add more or less depending on how sweet you'd like the cocktail."
    ),
    Cocktail(
        number: 68, category: .vodka, name: "Bloody Mary",
        flavorProfile: "Savory, Tomato, Spice, Citrus, Rich.",
        history: "The Bloody Mary is an iconic brunch cocktail and believed to be created by Fernand Petiot in the 1920s while bartending at the iconic Harry's New York Bar in Paris. The Bloody Mary is a true \"template\" cocktail, meaning there are thousands of different ways to make this drink, and it's really up to your personal preference what to include or leave out of your own recipe.",
        ingredients: [
            Ingredient(.vodka, amount: 1.5),
            Ingredient(.lemonJuice, amount: 0.5),
            Ingredient(.tomatoJuice, amount: 4),
            Ingredient(.worcestershire, amount: 1),
            Ingredient(.horseradish, amount: 0.5),
            Ingredient(.hotSauce, amount: 2),
            Ingredient(.saltAndPepper, amount: 1),
            Ingredient(.celery, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake drink for 8-10 seconds.", "Salt rim of your glass and add ice.", "Strain cocktail into glass.", "Garnish with celery, olives and lemon wedge."],
        supplies: [.shaker, .hawthorneStrainer, .juicer, .glasses([.collins])],
        tip: "Helpful Tips: Try adding .25oz of pickle infused vodka or pickle juice to add a pickled flavor!"
    ),
    Cocktail(
        number: 69, category: .vodka, name: "Cape Codder",
        flavorProfile: "Cranberry, Sweet-Tart Balance, Light, Refreshing.",
        history: "The Cape Codder is the official drink of Massachusetts and was created by Ocean Spray cranberry growers in the 1940s. Originally named \"Red Devil,\" the drink was renamed in the early 1960s and paved the way for other popular cocktails such as the Bay Breeze and Sea Breeze.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.cranberryJuice, amount: 3.0),
            Ingredient(.limeWedge, amount: 0.0)
        ],
        instructions: ["Add Ice to your glass.", "Add ingredients to glass.", "Use bar spoon and lightly stir for 10 seconds.", "Garnish with a lime wedge."],
        supplies: [.jigger, .barSpoon, .glasses([.collins, .rocks])],
        tip: "Fun Tips: Spritz up your Cape Codder by adding ginger ale, lemon soda, or even Prosecco!"
    ),
    Cocktail(
        number: 70, category: .vodka, name: "Cosmopolitan",
        flavorProfile: "Fruity, Tart/Sweet Balance, Refreshing, Cranberry.",
        history: "The Cosmopolitan was created in the 1980s. It's difficult to say which bartender created the drink, but it quickly became a popular cocktail of Hollywood and Broadway celebrities. It was featured in the TV show \"Sex in the City\" and the cocktail quickly became a modern classic requested all around the world. Traditionally the cocktail would be made with Absolut Citron vodka, but you can use the vodka of your choice.",
        ingredients: [
            Ingredient(.vodka, amount: 1.5),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.25),
            Ingredient(.tripleSec, amount: 1.0),
            Ingredient(.cranberryJuice, amount: 1.0)
        ],
        instructions: ["Place all ingredients into a shaker, then add ice.", "Shake drink for 8-10 seconds.", "Double strain into martini glass.", "Garnish with a lime wheel or orange peel."],
        supplies: [.shaker, .strainer, .fineStrainer, .jigger, .juicer, .glasses([.martini])],
        tip: "Similar Cocktails: Moscow Mule, Kamikaze, Clover Club, Margarita, Sidecar."
    ),
    Cocktail(
        number: 71, category: .vodka, name: "Espresso Martini",
        flavorProfile: "Coffee, Bitter, Sweet, Frothy.",
        history: "The Espresso Martini was invented by the legendary bartender Dick Bradsell in 1983 at the Soho Brasserie in London. Bradsell claims a young super model came into the bar asking for a drink that would \"wake her up and [mess]her up. The cocktail was wildly popular in the 1990s and today is considered one of the most popular cocktails in Australia.",
        ingredients: [
            Ingredient(.vodka, amount: 1.0),
            Ingredient(.kahlua, amount: 1.0),
            Ingredient(.espresso, amount: 1),
            Ingredient(.coffeBeans, amount: 3)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 18-20 seconds.", "Double strain into glass.", "Garnish with 3 coffee beans on top."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .glasses([.coupe, .martini])],
        tip: "Fun Tips: Add a citrus kick by adding a spritz of lemon before you shake!"
    ),
    Cocktail(
        number: 72, category: .vodka, name: "French Martini",
        flavorProfile: "Sweet, Pineapple, Raspberry, Light, Frothy.",
        history: "The French Martini was created in the 1980s in New York in one of Keith McNally's Bars. The 80s and 90s were a time of cocktail resurgence in America, and any drink being served in a \"V-shaped\" glass was called a martini. The cocktail gained popularity around the world and in Europe was named the \"Fresh Fruit Martini.\"",
        ingredients: [
            Ingredient(.vodka, amount: 1.5),
            Ingredient(.raspberryLiqueur, amount: 0.75),
            Ingredient(.pineappleJuice, amount: 1.5),
            Ingredient(.raspberriesOrPineappleWedgeOrLemontTwist, amount: 0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 12-15 seconds.", "Double strain into coupe or martini glass.", "No garnish needed, but pineapple or raspberries are popular choices."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .glasses([.coupe, .martini])],
        tip: "Helpful Tips: Use less raspberry liqueur for a lighter cocktail, and add more for a sweeter cocktail!"
    ),
    Cocktail(
        number: 73, category: .vodka, name: "Greyhound & Salty Dog",
        flavorProfile: "Bitter, Grapefruit, Light, Refreshing.",
        history: "The Greyhound dates back to 1930 when it first appeared in Harry Craddock's Savoy Cocktail Book. In the 30s vodka was very unpopular, and the original cocktail was most likely made with gin. In 1945 a vodka version was served at the Greyhound's popular restaurant chain Post House that was located at bus terminals. Later the cocktail was served with a salted rim and given the name Salty Dog.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.grapefruitJucie, amount: 3.0),
            Ingredient(.grapefruitWedge, amount: 0.0)
        ],
        instructions: ["(Optional for Salty Dog) Salt rim of glass.", "Add ice to your glass.", "Add ingredients to glass.", "Use bar spoon and lightly stir for 10 seconds.", "Garnish with grapefruit wedge."],
        supplies: [.jigger, .barSpoon, .glasses([.collins, .rocks])],
        tip: "Helpful Tips: Salty dog and Greyhounds are the exact same drink, except a salty dog has salt on the rim of the glass!"
    ),
    Cocktail(
        number: 74, category: .vodka, name: "Hairy Navel & Fuzzy Navel",
        flavorProfile: "Orange, Peach, Fruity, Sweet.",
        history: "DeKuyper Peachtree Schnapps was released in 1984 a year removed from fruity schnapps successfully hitting the American market. The Fuzzy Navel was created by Jack Doyle, an executive at National Distillers, to create a simple cocktail anyone could make 7 days a week. The Fuzzy Navel had so much success that Dekuyper's peach schnapps became a top 10 selling alcohol in America. The Hairy Navel was a quick evolution for a boozier drink.",
        ingredients: [
            Ingredient(.orangeJuice, amount: 4.0),
            Ingredient(.fuzzyNavelPeachSchnapps, amount: 1.5),
            Ingredient(.hairyNavelVodka, amount: 1),
            Ingredient(.hairyNavelPeachSchnapps, amount: 0.5)
        ],
        instructions: ["Add ice to your glass.", "Add ingredients to glass.", "Use bar spoon and lightly stir for 10 seconds.", "Garnish with orange wedge."],
        supplies: [.jigger, .barSpoon, .glasses([.collins, .rocks])],
        tip: "Drink Tips: A Hairy Navel will be a more powerful cocktail, and have far less peach schnapps flavor!"
    ),
    Cocktail(
        number: 75, category: .vodka, name: "Harvey Wallbanger",
        flavorProfile: "Fruity, Orange, Vanilla, Light.",
        history: "The first record of a Harvey Wallbanger dates back to the 1950s made by barman Donato \"Duke\" Antone at the Blackwatch Bar in Hollywood. The cocktail was initially named the Duke's Screwdriver. In 1969 Galliano introduced a cartoony surfer mascot named Harvey Wallbanger, and the cartoon became a hit. The cartoon was even a write-in candidate in the 1972 presidential election. This campaign caused Galliano sales to triple, and the Harvey Wallbanger cocktail became a sensation.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.orangeJuice, amount: 4.0),
            Ingredient(.galliano, amount: 0.5),
            Ingredient(.orangeWedgeOrCherry, amount: 0.0)
        ],
        instructions: ["Add ice to your glass.", "Add vodka and orange juice to glass.", "Lightly stir with bar spoon for 10 seconds.", "Float Galliano on top and garnish with orange wedge and optional cherry."],
        supplies: [.jigger, .barSpoon, .glasses([.collins])],
        tip: "Helpful Tips: Leave out the Galliano and you have a screwdriver!"
    ),
    Cocktail(
        number: 76, category: .vodka, name: "Kamikaze",
        flavorProfile: "Tart, Orange, Crisp, Refreshing.",
        history: "According to historians the Kamikaze was a popular nightclub disco cocktail created in the 1970s. The Kamikaze was one of the first cocktails made to be a shooter and was often frowned upon by the older generation. It would be popular to throw in any sugary schnapps or liqueur to flavor the shooters even more. Now the recipe is more balanced and most often found served as a cocktail instead of a shooter.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.orangeLiqueur, amount: 0.75),
            Ingredient(.limeWheel, amount: 0.0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake your drink for 8-10 seconds.", "Double strain into coupe or martini glass.", "Garnish with a lime wheel."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .martini])],
        tip: "Fun Tips: This recipe can also be served as two shooters, so if you want a single shooter simply cut the amounts in half!"
    ),
    Cocktail(
        number: 77, category: .vodka, name: "Lemon Drop",
        flavorProfile: "Lemon, Sugar, Orange, Refreshing.",
        history: "The Lemon Drop was created in the 1970s by Norman Jay Hobday in San Francisco at a bar called Henry's Africa. The drink was created to pay homage to the lemon candies that help with sore throats. During the 70s vodka was all the rage, and so was mixing it with schnapps and flavored liqueurs. The Lemon Drop has stood the test of time and is still a very popular cocktail today.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.tripleSec, amount: 0.75),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.lemonTwist, amount: 0.0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake your drink for 8-10 Seconds.", "Sugar rim to your glass.", "Double strain into coupe or martini glass.", "Garnish with lemon twist or wheel."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .martini])],
        tip: "Fun Tips: For a sweeter version add .5oz of simple syrup to your ingredients!"
    ),
    Cocktail(
        number: 78, category: .vodka, name: "Mind Eraser",
        flavorProfile: "Sweet, Coffee, Crisp, Refreshing.",
        history: "The Mind Eraser is a riff on the popular cocktail the Black Russian. It was first recorded in the 1980s during the vodka craze in the US, and often taken as a shooter. The cocktail is designed to be layered so you can get a different taste with each Sip you take. However, many out there like the drink stirred for a more even tasting cocktail.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.kahlua, amount: 2.0),
            Ingredient(.sodaWater, amount: 2.0)
        ],
        instructions: ["Add ice to your glass.", "Pour in Kahlua.", "Slowly pour in vodka.", "Top off with soda water."],
        supplies: [.jigger, .glasses([.rocks, .collins])],
        tip: "Helpful Tips: For a more consistent flavor throughout the drink give it a quick stir for 10 seconds before drinking."
    ),
    Cocktail(
        number: 79, category: .vodka, name: "Moscow Mule",
        flavorProfile: "Tart, Ginger, Sweet, Bubbly, Refreshing.",
        history: "The Moscow Mule was created in the 1940s at the Cock n' Bull Bar in Los Angeles owned by Jack Morgan. At the time vodka was very unpopular, and the Mule was created as a way to sell ginger beer that no one wanted and vodka that no one had interest in. They decided to put the drink in copper mugs which were gifted to Morgan by his girlfriend who worked at a copper plant. The unlikely combination was oddly a huge hit, and still one of the most popular cocktails in the world today.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.limeJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.25),
            Ingredient(.gingerBeer, amount: 0.0),
            Ingredient(.limeWedge, amount: 0.0)
        ],
        instructions: ["Add vodka, lime juice, and simple syrup to shaker.", "Add ice and shake your drink for 8-10 seconds.", "Add ice to copper mug and strain drink into mug.", "Top drink with ginger beer and garnish with a lime wedge."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glasses([.copperMug, .doubleRocks])],
        tip: "Fun Tips: Some ginger beers are sweeter than others. Only add simple syrup if you have a spicier ginger beer!"
    ),
    Cocktail(
        number: 80, category: .vodka, name: "Sea Breeze",
        flavorProfile: "Grapefruit, Sweet, Refreshing, Cranberry.",
        history: "The Sea Breeze is another variation of the popular Cape Codder. Most believe it was created at some point in the 1980s but really gained popularity in the 1990s when Ocean Spray and Absolut Vodka started marketing the cocktail heavily. This simple 3-ingredient cocktail is a favorite on a warm sunny day.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.grapefruitJucie, amount: 2.0),
            Ingredient(.cranberryJuice, amount: 1.0)
        ],
        instructions: ["Add Ice to your glass.", "Add ingredients to glass.", "Use bar spoon and lightly stir for 10 seconds.", "Garnish with lime wedge."],
        supplies: [.jigger, .juicer, .barSpoon, .glasses([.collins, .rocks])],
        tip: "Fun Tips: For a sweeter cocktail switch the amounts of cranberry and grapefruit juice!"
    ),
    Cocktail(
        number: 81, category: .vodka, name: "Sex on the Beach",
        flavorProfile: "Sweet, Peach, Orange, Cranberry, Smooth.",
        history: "The Sex on the Beach is believed to have been created by Ted Pizio, a bartender at Confetti's Bar in Florida. He created the cocktail for a competition to sell the most peach schnapps in his area. He came up with the name to attract spring breakers and sell to the tourist crowd. The cocktail then got featured on Gl Friday's cocktail list and quickly turned into a cult classic.",
        ingredients: [
            Ingredient(.vodka, amount: 1.5),
            Ingredient(.peachschnapps, amount: 0.5),
            Ingredient(.orangeJuice, amount: 1.5),
            Ingredient(.cranberryJuice, amount: 1.5),
            Ingredient(.orangeWheelAndCherry, amount: 0)
        ],
        instructions: ["Add vodka, peach schnapps and orange juice to shaker.", "Add ice and shake your drink for 8-10 seconds.", "Add Ice to glass, add in cranberry and strain rest of cocktail into glass.", "Garnish with orange wheel and cherry."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .glasses([.hurricane, .collins])],
        tip: "Fun Tips: Adding cranberry first creates a fun layered look, but stir the cocktail before you drink it for the best flavor!"
    ),
    Cocktail(
        number: 82, category: .vodka, name: "Vodka Martini",
        flavorProfile: "Boozy, Thin, Herbal, Simple.",
        history: "While the Martini dates back to the 1800s, the idea of a vodka martini is only as recent as the 1940s. Originally called a Kangaroo, there are few known records that highlight vodka and vermouth. Author lan Fleming, who famously wrote the James Bond books, would have Bond order martinis featuring vodka. As more men wanted to be like James Bond, vodka became more acceptable to order as a martini. Today it is nearly interchangeable with gin.",
        ingredients: [
            Ingredient(.vodka, amount: 2.25),
            Ingredient(.dryVermouth, amount: 0.75),
            Ingredient(.oliveJuice, amount: 0.5),
            Ingredient(.lemonTwist, amount: 0.0)
        ],
        instructions: ["Place vodka and vermouth into mixing glass.", "Add ice and stir for 30 seconds.", "Strain into coupe or martini glass.", "Finish with your choice of garnish."],
        supplies: [.mixingGlass, .barSpoon, .hawthorneStrainer, .jigger, .yPeeler, .glasses([.coupe, .martini])],
        tip: "Helpful Tips: A \"dry\" martini refers to using less vermouth, and a \"wet\" martini refers to adding more vermouth. Try them out and find your favorite combination!"
    ),
    Cocktail(
        number: 83, category: .vodka, name: "White Russian",
        flavorProfile: "Sweet, Coffee, Creamy, Smooth.",
        history: "The first mention of a White Russian appears in the Oakland Tribune in 1965, and was a modified version of the Black Russian. The cocktail was not very popular, but in 1998 it was featured heavily in the movie The Big Lebowski. As the movie turned into a cult classic so did the cocktail, and today is one of the most popular cocktails in the world.",
        ingredients: [
            Ingredient(.vodka, amount: 2.0),
            Ingredient(.kahlua, amount: 1.0),
            Ingredient(.heavyCream, amount: 0.0)
        ],
        instructions: ["Add ice to your glass.", "Add vodka and Kahlua and lightly stir for 10 seconds.", "Shake heavy cream until thick.", "Layer heavy cream on top."],
        supplies: [.jigger, .barSpoon, .glasses([.rocks])],
        tip: "Helpful Tips: Try a more traditional version by adding all ingredients to a shaker and shake for 8-10 seconds."
    ),
    Cocktail(
        number: 84, category: .whiskey, name: "Boulevardier",
        flavorProfile: "Bitter, Orange, Herbal, Vanilla, Sweet, Intense.",
        history: "The Boulevardier was first recorded in Harry McElhone's book Cocktails and Barflies in 1927. It is closely related to the Negroni but instead of gin this version uses whiskey. It's one of few cocktails to highlight Campari, a bitter orange liqueur, but those who enjoy it love the Boulevardier as it's one of the most popular cocktails in the world.",
        ingredients: [
            Ingredient(.whiskey, amount: 1.5),
            Ingredient(.campari, amount: 0.75),
            Ingredient(.sweetVermouth, amount: 0.75),
            Ingredient(.orangePeel, amount: 0.0)
        ],
        instructions: ["Add ingredients to mixing glass.", "Add ice and stir for 30 seconds.", "If drinking over ice, add ice to rocks glass. Otherwise, use Coupe/Martini glass.", "Strain cocktail into glass.", "Garnish with an orange peel."],
        supplies: [.mixingGlass, .barSpoon, .hawthorneStrainer, .jigger, .glasses([.rocks, .coupe, .martini])],
        tip: "Drink Tips: This is a whiskey forward recipe, for the original recipe simply add 1oz of each ingredient!"
    ),
    Cocktail(
        number: 85, category: .whiskey, name: "Final Ward",
        flavorProfile: "Cherry, Spice, Herbal, Citrus, Light Smoke.",
        history: "The Final Ward was created by Phil Ward in 2007 while working at Death & Co. in New York City. This is a popular riff of the Last Word, and in fact the only difference is replacing the gin for whiskey and substituting lemon juice. The combination of maraschino and Green Chartreuse gives a lovely herbal flavor that has taken the world by storm!",
        ingredients: [
            Ingredient(.ryeWhiskey, amount: 0.75),
            Ingredient(.greenChartreuse, amount: 0.75),
            Ingredient(.maraschinoLiqueur, amount: 0.75),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.lemonPeelOrCherry, amount: 0.0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into glass.", "No garnish needed, but a cherry or lemon peel is popular."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .nickAndNora])],
        tip: "Helpful Tips: Enjoyed the Final Ward? Try the closely related Last Word cocktail that is one of the most popular cocktails in the world!"
    ),
    Cocktail(
        number: 86, category: .whiskey, name: "Gold Rush",
        flavorProfile: "Honey, Citrus, Vanilla, Rich.",
        history: "The Gold Rush was created by T.J. Siegal in 2001 who was bartending at the popular Milk & Honey Bar in New York City. Siegal wanted to change up the classic whiskey sour and decided to use a rich honey syrup, and it was an instant hit. It is perfect for a sore throat and has become a popular cocktail all around the world.",
        ingredients: [
            Ingredient(.bourbon, amount: 2.0),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.honeySyrup, amount: 0.75),
            Ingredient(.lemonTwist, amount: 0.0)
        ],
        instructions: ["Honey Syrup: 3 parts Honey, 1 part hot water. Stir and let come to room temperature.", "Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 12-15 seconds.", "Add Ice or large ice cube to rocks glass and strain cocktail into glass.", "Garnish with a lemon wedge or twist."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glasses([.rocks])],
        tip: "Fun Tips: If the honey flavor is too strong, try lowering your syrup ratio to 2-1 or 1-1!"
    ),
    Cocktail(
        number: 87, category: .whiskey, name: "Hot Toddy",
        flavorProfile: "Lemon, Honey, Thin, Vanilla.",
        history: "The Hot Toddy is an old cocktail that dates back to the 1700s or possibly even earlier. Today it is considered the perfect drink when you have a sore throat or even have a cold. It's also one of few hot cocktails to stand the test of time, and still one of the most popular cocktails in the entire world.",
        ingredients: [
            Ingredient(.whiskey, amount: 2.0),
            Ingredient(.lemonJuice, amount: 0.5),
            Ingredient(.honeySyrup, amount: 0.5),
            Ingredient(.hotWater, amount: 0.0),
            Ingredient(.cinnamonStick, amount: 0.0)
        ],
        instructions: ["Honey Syrup: 3 parts Honey, 1 part hot water.", "Warm up glass by adding hot water, then discard water and add ingredients.", "Top off cocktail with hot water.", "Using bar spoon lightly stir for 10 seconds.", "Garnish with lemon wedge."],
        supplies: [.barSpoon, .jigger, .glasses([.coffee])],
        tip: "Fun Tips: Adjust amount of honey syrup to best fit your palette!"
    ),
    Cocktail(
        number: 88, category: .whiskey, name: "Irish Coffee",
        flavorProfile: "Coffee, Creamy, Bitter, Sweet.",
        history: "The Irish Coffee was created by a chef named Joe Sheridan who worked at Foynes Airbase in Limerick, Ireland. One day author Stanton Delaplane was visiting and loved the cocktail so much he brought the recipe back to a bartender at the Buena Vista in San Francisco. That bartender was Jack Koeppler and he even traveled to Limerick to learn the cocktail from Sheridan himself. The Buena Vista is still one of the most visited bars in the world and known for its Irish Coffees.",
        ingredients: [
            Ingredient(.whiskey, amount: 2.0),
            Ingredient(.sugarCube, amount: 2.0),
            Ingredient(.coffee, amount: 0.0),
            Ingredient(.heavyCream, amount: 0.0)
        ],
        instructions: ["Warm up glass by adding hot water, then discard water and add whiskey, sugar and half coffee.", "Use bar spoon to stir and dissolve sugar.", "Fill the rest of glass with coffee and top with shaken heavy cream."],
        supplies: [.barSpoon, .jigger, .glasses([.coffee])],
        tip: "Helpful Tips: Use a mason jar or condiment squeezer to shake heavy cream and give it a thick consistency!"
    ),
    Cocktail(
        number: 89, category: .whiskey, name: "Manhattan",
        flavorProfile: "Whiskey, Herbal, Sweet, Smooth.",
        history: "The Manhattan is believed to have been invented at the Manhattan Club in New York around the 1870s. Traditionally the cocktail would be made with rye whiskey, but as the cocktail has evolved so has the introduction of bourbon. This cocktail has become a global phenomenon and a must-know for all bartenders and whiskey fans!",
        ingredients: [
            Ingredient(.ryeWhiskey, amount: 2.0),
            Ingredient(.sweetVermouth, amount: 1.0),
            Ingredient(.angosturaBitters, amount: 2.0),
            Ingredient(.orangePeelOrCherry, amount: 0.0)
        ],
        instructions: ["Add ingredients to mixing glass.", "Add ice and stir for 30 seconds.", "Strain cocktail into glass.", "Garnish with cherry or orange peel."],
        supplies: [.mixingGlass, .barSpoon, .hawthorneStrainer, .jigger, .yPeeler, .glasses([.coupe, .martini])],
        tip: "Fun Tips: Make a \"perfect\" Manhattan by using just .5oz sweet vermouth and adding .5oz dry vermouth!"
    ),
    Cocktail(
        number: 90, category: .whiskey, name: "Maple Walnut Old Fashioned",
        flavorProfile: "Sweet, Maple, Walnut, Bourbon, Orange.",
        history: "The Maple Walnut Old Fashioned is a Cocktail Cards original created by A Rantz in 2017 while bartending at Sand Point Grill in Seattle Washington. The cocktail is another riff to the classic old-fashioned and a favorite so highly requested it had to be added to the card set!",
        ingredients: [
            Ingredient(.bourbon, amount: 2.0),
            Ingredient(.blackWalnutBitters, amount: 2),
            Ingredient(.realMapleSyrup, amount: 1),
            Ingredient(.orangePeel, amount: 0.0)
        ],
        instructions: ["Add ingredients to mixing glass.", "Add ice and stir for 30 Seconds.", "Add ice or large ice cube to rocks glass.", "Strain cocktail into glass.", "Garnish with an orange peel."],
        supplies: [.mixingGlass, .barSpoon, .hawthorneStrainer, .jigger, .glasses([.rocks])],
        tip: "Helpful Tips: Maple syrup can be a strong flavor, so experiment with how much to add to get your perfect balance of sweet!"
    ),
    Cocktail(
        number: 91, category: .whiskey, name: "Mint Julep",
        flavorProfile: "Sweet, Mint, Refreshing, Bourbon.",
        history: "The Mint Julep was created in 1807 by a US Senator by the name of Henry Clay. He shared his recipe with his political friends at the Willard Hotel's Round Robin Bar in Washington D.C. and word quickly spread. In 1938 the cocktail became the official drink of the Kentucky Derby, and it's still how most people know the cocktail today. Each year over the 2-day event the Kentucky Derby will sell over 120,000 Mint Juleps!",
        ingredients: [
            Ingredient(.bourbon, amount: 2.5),
            Ingredient(.simpleSyrup, amount: 0.25),
            Ingredient(.mint, amount: 10.0)
        ],
        instructions: ["Place your mint into your hand and give it a light slap.", "Add mint and rest of ingredients to glass. Using a muddle lightly press down on the mint.", "Add ice to Lewis bag and crush.", "Add ice to glass about ¾ full and stir with spoon.", "Top off glass with ice and garnish with handful of mint sprigs.v"],
        supplies: [.jigger, .muddler, .lewisBag, .glasses([.doubleRocks])],
        tip: "Fun Tips: If you like your julep sweeter, increase the simple syrup to .5oz!"
    ),
    Cocktail(
        number: 92, category: .whiskey, name: "New York Sour",
        flavorProfile: "Citrus, Sweet, Bourbon, Tannin, Creamy.",
        history: "The extremely popular Whiskey Sour was created in the 1860s, and then over the next few decades many variations became popular including the New York Sour which dates back to the 1890s. Often referred to as a Claret Snap, it had the addition of egg white and red wine. There is little knowledge of how it eventually got the name New York Sour, but today it is still one of the most popular cocktails around the world.",
        ingredients: [
            Ingredient(.whiskey, amount: 2.0),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.75),
            Ingredient(.eggWhite, amount: 1.0),
            Ingredient(.redWine, amount: 0.0)
        ],
        instructions: ["Place all ingredients (except red wine) into a shaker without ice.", "Dry shake (no ice) for 30 seconds.", "Add ice to shaker and shake your drink for 8-10 seconds.", "(optional) Add ice or large ice cube to glass.", "Double strain cocktail into glass.", "Use bar spoon to layer a float of red wine (.25oz)."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .rocks])],
        tip: "Helpful Tips: Dry shaking helps turn the egg white into a meringue adding a frothy head to your cocktail."
    ),
    Cocktail(
        number: 93, category: .whiskey, name: "Old Fashioned",
        flavorProfile: "Sweet, Spice, Balanced, Whiskey Forward.",
        history: "The Old Fashioned stems from cocktails dating back to the 1850s. With ice not readily available, sugar cubes and bitters were mixed with room temperature spirits, most likely gin or genever. Later a version with whiskey would come around and syrups would be used due to ice being more available. However, during Prohibition fruits and sugar cubes were added back into the cocktail to mask poor-tasting alcohol. The modern Old Fashioned now utilizes syrups and bitters and has turned into the one of the most popular cocktails on the planet.",
        ingredients: [
            Ingredient(.whiskey, amount: 0.0),
            Ingredient(.angosturaBitters, amount: 0.0),
            Ingredient(.demeraraSyrup, amount: 0.25),
            Ingredient(.orangePeelOrCherry, amount: 0.0)
        ],
        instructions: ["Add ingredients to mixing glass. You can substitute Demerara Syrup for Symple Syrup or Maple Syrup.", "Add ice and stir for 30 seconds.", "Add large ice cube or ice to rocks glass.", "Strain cocktail into glass.", "Garnish with orange peel."],
        supplies: [.mixingGlass, .barSpoon, .hawthorneStrainer, .jigger, .glasses([.rocks])],
        tip: "Helpful Tips: Try other bitters to find your favorite old fashioned. Chocolate, creole, and tiki bitters are popular options!"
    ),
    Cocktail(
        number: 94, category: .whiskey, name: "Paper Plane",
        flavorProfile: "Bitter, Orange, Herbal, Citrus, Bourbon.",
        history: "The Paper Plane was created by Sam Ross while working at the Violet Hour in Chicago before tweaking the recipe and bringing it to the legendary Milk & Honey speakeasy in New York City. The popular song \"Paper Planes\" by M.I.A. was playing when Ross created the drink and it inspired the name for the cocktail. This modern classic has rapidly gained popularity and a favorite of modern cocktails.",
        ingredients: [
            Ingredient(.aperol, amount: 0.75),
            Ingredient(.bourbon, amount: 0.75),
            Ingredient(.amaroNonino, amount: 0.75),
            Ingredient(.lemonJuice, amount: 0.75)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice and shake for 12-15 seconds.", "Double strain into glass."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .nickAndNora])],
        tip: "Drink Tips: Amaros are all different, so try and get Nonino. Montenegro is a similar alternative!"
    ),
    Cocktail(
        number: 95, category: .whiskey, name: "Sazerac",
        flavorProfile: "Spicey, Strong, Hint of Anise, Sweet.",
        history: "The Sazerac was inspired by Antoine Peychaud, a pharmacist in the 1950s. Peychaud had his signature bitters that he would serve with brandy to patients as a \"cure-all\" medicine. A local coffee shop called the Exchange Coffee House took this recipe and featured it on their menu. It sold so well the bookkeep- er, Thomas H. Handy, turned the coffee house into a bar and renamed it Sazerac after the brandy featured in the cocktail. During the 1860s French vineyards were destroyed by aphids making brandy inaccessible, and the cocktail switched to rye whiskey as it was readily available.",
        ingredients: [
            Ingredient(.ryeWhiskey, amount: 2.0),
            Ingredient(.sugarCube, amount: 1.0),
            Ingredient(.peychaudsBitters, amount: 5.0),
            Ingredient(.absinthe, amount: 0.0),
            Ingredient(.lemonTwist, amount: 0.0)
        ],
        instructions: ["Add sugar cube to mixing glass and pour 4-6 dashes of bitters on top.", "Add whiskey and lightly muddle sugar to break it up.", "Add ice and Stir for 30-45 seconds.", "Use atomizer or pour a small amount of absinthe and run around the inside of glass then discard. Strain into rocks glass without ice.", "Garnish with a lemon peel."],
        supplies: [.mixingGlass, .barSpoon, .hawthorneStrainer, .muddler, .glasses([.rocks])],
        tip: "Helpful Tips: The cocktail was originally made with cognac, so try the same recipe with cognac and see which one you like best!"
    ),
    Cocktail(
        number: 96, category: .whiskey, name: "Toronto",
        flavorProfile: "Herbal, Spice, Sweet, Vanilla, Fernet.",
        history: "The Toronto cocktail is first documented in Robert Vermier's book Cocktails: How to Mix Them in 1922. Originally dubbed the Fernet Cocktail, it became so popular in Toronto Canada, that is eventually got renamed the Toronto cocktail. It is the most popular drink to feature Fernet, a strong herbal amaro that is popular for its digestif properties.",
        ingredients: [
            Ingredient(.ryeWhiskey, amount: 2.0),
            Ingredient(.fernetBranca, amount: 0.25),
            Ingredient(.simpleSyrup, amount: 0.25),
            Ingredient(.angosturaBitters, amount: 4.0),
            Ingredient(.lemonPeel, amount: 0.0)
        ],
        instructions: ["Add ingredients to mixing glass.", "Add ice and stir for 30 seconds.", "(optional) Add large ice cube to rocks glass.", "Strain cocktail into glass.", "Garnish with orange or lemon peel."],
        supplies: [.mixingGlass, .barSpoon, .jigger, .glasses([.smallCoupe, .rocks])],
        tip: "Helpful Tips: Fernet is a strong flavor and not enjoyed by all, so try purchasing a smaller bottle first to see if you enjoy the cocktail!"
    ),
    Cocktail(
        number: 97, category: .whiskey, name: "Trinidad Sour",
        flavorProfile: "Bitter, Citrus, Almond, Vanilla, Herbal.",
        history: "The Trinidad Sour was created by Giuseppe Gonzales, a bartender at the Clover Club in New York City in 2008. The cocktail was first made for Star Chefs, an online website for professional chefs and bartenders. This unique cocktail stands alone as it features Angostura bitters as its main ingredient. However, the unique flavor and combination have gotten the attention of bartenders around the world and has turned into a global phenomenon.",
        ingredients: [
            Ingredient(.angosturaBitters, amount: 1.5),
            Ingredient(.ryeWhiskey, amount: 0.5),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.orgeatSyrup, amount: 1.0)
        ],
        instructions: ["Add all ingredients into a shaker.", "Add ice and shake for 8-10 seconds.", "Double strain into glass.", "No garnish, but lemon peel is popular."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .nickAndNora])],
        tip: "Fun Tips: Don't be fooled by bitters, the ABV of Angostura bitters is 44.7%, so this drink will give you quite a kick!"
    ),
    Cocktail(
        number: 98, category: .whiskey, name: "Washington Apple",
        flavorProfile: "Apple, Cranberry, Sweet, Candy.",
        history: "The Washington Apple is a Northwest cocktail that is popular as both a martini or as a shooter. Washington is known for its apples, and this cocktail was created to imitate the flavor of Northwest apples. After the end of Prohibition, Washington state did not reopen distilleries until 2010, so the recipe would normally call for Crown Royal. However, with more distilleries opening in Washington more recipes call for Washington State Whiskey.",
        ingredients: [
            Ingredient(.crownRoyal, amount: 2),
            Ingredient(.sourAppleSchnapps, amount: 0.75),
            Ingredient(.cranberryJuice, amount: 1.0),
            Ingredient(.appleSlices, amount: 0.0)
        ],
        instructions: ["Add all ingredients into a shaker.", "Add ice and shake for 8-10 seconds.", "Double strain into glass.", "Garnish with thin apple slice."],
        supplies: [.shaker, .hawthorneStrainer, .fineStrainer, .jigger, .glasses([.martini, .coupe])],
        tip: "Helpful Tips: Popular as a shot, this recipe makes two shooters, or split recipe in half for a single shooter!"
    ),
    Cocktail(
        number: 99, category: .whiskey, name: "Whiskey Sour",
        flavorProfile: "Tart, Citrus, Creamy, Sweet, Vanilla.",
        history: "The Whiskey Sour first makes its appearance in Jerry Thomas' The Bartenders Guide in 1862. It's very likely sours have existed long before that point using other spirits and were drunk by sailors to combat scurvy. For nearly 100 years the cocktail was so popular it was considered \"a cardinal point of American drinking.\" Many variations popped up including the Boston Sour that added egg white. This version is still the most popular way to serve a Whiskey Sour today.",
        ingredients: [
            Ingredient(.whiskey, amount: 2.0),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.simpleSyrup, amount: 0.75),
            Ingredient(.eggWhite, amount: 1.0),
            Ingredient(.angosturaBitters, amount: 0.0)
        ],
        instructions: ["Place all ingredients into a shaker without ice.", "Dry shake (no ice) for 30 seconds.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Double strain into coupe or martini glass.", "Garnish with Angostura bitter drops on top."],
        supplies: [.shaker, .strainer, .fineStrainer, .jigger, .juicer, .glasses([.coupe, .martini])],
        tip: "Fun Tips: Dry shaking without ice helps whip the egg white into a frothy meringue giving the drink a foamy top layer that is very popular in cocktails."
    ),
    Cocktail(
        number: 100, category: .whiskey, name: "Cabana Boy",
        flavorProfile: "Ginger, Fruity, Pineapple, Tart, Sweet.",
        history: "The Cabana Boy was created by Jennifer Wirkman & Doug Betzold in 2020. They were the winners and supporters of the Cocktail Cards Ultimate Fan Package! Inspired by their first trip to Maui together, they wanted to bring the fruity flavors of the islands and create a spin on the ultra-popular Kentucky Mule. The cocktail finishes with a vibrant red hue that will remind you of a beautiful island sunset. All that is missing is the Cabana Boy!",
        ingredients: [
            Ingredient(.bourbon, amount: 1.5),
            Ingredient(.lemonJuice, amount: 0.75),
            Ingredient(.gingerSyrup, amount: 0.25),
            Ingredient(.orgeatSyrup, amount: 0.5),
            Ingredient(.pineappleJuice, amount: 0.5),
            Ingredient(.grenadine, amount: 0.25),
            Ingredient(.gingerBeer, amount: 0.0)
        ],
        instructions: ["Place all ingredients into a shaker.", "Add ice to shaker and shake your drink for 8-10 seconds.", "Add ice to Collins glass.", "Strain cocktail into glass.", "Top off with ginger beer and garnish with lemon wedge and cherry, (umbrella & cabana bov optional!)."],
        supplies: [.shaker, .hawthorneStrainer, .jigger, .juicer, .glasses([.collins])],
        tip: "Helpful Tips: 1 cup hot water, 1 cup sugar, 1 cup chopped ginger in blender. Blend, and strain with cheesecloth. Bottle and refrigerate."
    )
]
