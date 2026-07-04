#!/bin/bash
# One-shot batch generation of site imagery. Run from project root.
set -e
G="node tools/gen_image.mjs"

$G "Using this photo as reference: keep the exact same warm Amish deli interior scene, but remove all lettering and words from every sign, chalkboard and label — leave the chalkboards decoratively blank or with simple chalk underline flourishes, and make the small deli-case labels blank black tags. Keep lighting, people, food, and composition identical." --ref assets/hero-deli.png --out assets/hero-deli-clean.png --ar 16:9

$G "Overhead-angle photograph of a stacked deli sandwich on a red-and-white checkered paper liner in a wicker basket: thick-sliced roast beef, melted swiss, lettuce, tomato on fresh bakery bread, kettle chips beside it, rustic wooden table, warm natural light, shallow depth of field, appetizing editorial food photography" --out assets/sandwich.png --ar 4:3

$G "Close-up photograph of glazed cinnamon caramel donuts stacked on a vintage cake stand, caramel drizzle, warm bakery lighting, rustic wood background with soft-focus red-and-white checkered cloth, steam of fresh coffee cup nearby, appetizing editorial food photography" --out assets/donuts.png --ar 4:3

$G "Photograph of smoked baby back ribs fresh off the smoker, glistening with barbecue sauce, sliced on a butcher block with butcher paper, smoke wisps, sides of coleslaw and cornbread in small bowls, dark rustic background, dramatic warm light, appetizing editorial BBQ photography" --out assets/ribs.png --ar 4:3

$G "Photograph of a beautiful rustic wedding catering buffet in a barn venue: sliced smoked beef brisket on wooden boards, smoked macaroni and cheese in cast iron, fresh salads, fruit platters, mason jar drinks, string lights and eucalyptus garland, warm golden hour light, editorial catering photography, no people facing camera" --out assets/catering-hero.png --ar 16:9

$G "Photograph of an old-fashioned country store bulk candy display: big glass jars of colorful old-fashioned candies, red cinnamon licorice twists, striped candy sticks, wooden shelves, handwritten-style blank paper tags, warm nostalgic light, shallow depth of field" --out assets/candy.png --ar 4:3

$G "Photograph of an artisan Amish cheese and cured meat display: wheels of swiss and colby cheese, rolls of summer sausage and bologna on a butcher block, wooden crates, small blank chalkboard tags, warm side light, rustic editorial food photography" --out assets/cheese.png --ar 4:3

$G "Photograph of fresh-baked pies cooling on a wooden farmhouse table: golden lattice-top fruit pies, a cream pie, cinnamon rolls on a cooling rack, flour dusting, red-and-white checkered towel, morning window light, cozy Amish bakery feel, editorial food photography" --out assets/pies.png --ar 4:3

$G "Photograph of a peaceful northeast Indiana Amish countryside at golden hour: white farmhouse, red barn, silo, rolling green fields, a distant horse-drawn buggy on a country road, big warm sky, painterly natural light, editorial landscape photography" --out assets/countryside.png --ar 16:9

$G "Photograph of a corporate catering lunch spread of boxed deli sandwiches and wraps: neat rows of wrapped sandwiches with red-and-white checkered paper, fresh salad bowls, cookie platter, fruit tray on a clean conference table, bright welcoming light, editorial catering photography" --out assets/catering-lunch.png --ar 4:3

$G "Photograph of a pulled pork sandwich with barbecue sauce on a brioche bun with crispy smoked chicken wings beside it on checkered paper in baskets, rustic picnic table, warm afternoon light, appetizing editorial BBQ photography" --out assets/bbq.png --ar 4:3

$G "Photograph of fresh deli salads in white ceramic bowls on ice in a deli case: chef salad with ham and boiled eggs, spinach salad with cranberries and almonds, romaine wedge with bacon, bright fresh colors, clean appetizing editorial food photography, warm light" --out assets/salads.png --ar 4:3

echo "BATCH_DONE"
