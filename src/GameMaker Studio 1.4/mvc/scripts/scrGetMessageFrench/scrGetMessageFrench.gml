my_id=instance_create(x,y,objPhoneConversation)
objEffector.image_xscale=1
objEffector.image_yscale=1
if room=rmSequence1 {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="YOU HAVE ONE NEW MESSAGE!"
my_id.line2[0]="*BEEP*"
my_id.line1[1]="HI THIS IS 'TIM' AT THE"
my_id.line2[1]="BAKERY. THE COOKIES THAT"
my_id.line1[2]="YOU ORDERED SHOULD BE"
my_id.line2[2]="DELIVERED BY NOW..."
my_id.line1[3]="A LIST OF INGREDIENTS ARE"
my_id.line2[3]="INCLUDED... MAKE SURE"
my_id.line1[4]="THAT YOU READ THEM"
my_id.line2[4]="CAREFULY!"
my_id.line1[5]="..."
my_id.line2[5]="*CLICK*"
my_id.messages=5
global.phone=1
}
if argument0=objOpenedBox {
my_id.sprite=sprMaskLetter
with objEffector sprite=sprMaskLetter
my_id.line1[0]="The target is a briefcase."
my_id.line2[0]="Discretion is of essence."
my_id.line1[1]="Leave target at point"
my_id.line2[1]="F-32, inside the dumpster."
my_id.line1[2]="Failure is not an option."
my_id.line2[2]="We'll be watching you."
my_id.messages=2
global.package=1
}
}


if room=rmSequence2 {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="YOU HAVE ONE NEW MESSAGE!"
my_id.line2[0]="*BEEP*"
my_id.line1[1]="HELLO, IT'S 'LINDA'..."
my_id.line2[1]="I NEED A BABYSITTER"
my_id.line1[2]="RIGHT AWAY. GOT A FEW"
my_id.line2[2]="KIDS THAT NEED TO BE"
my_id.line1[3]="DISCIPLINED HERE. I'M"
my_id.line2[3]="AT EAST 7TH STREET."
my_id.line1[4]="MAKE SURE YOU HAVE A"
my_id.line2[4]="LONG TALK WITH THEM,"
my_id.line1[5]="I REALLY NEED SOMEONE"
my_id.line2[5]="TO GET THROUGH TO"
my_id.line1[6]="THESE RASCALS. AND LIKE"
my_id.line2[6]="LAST TIME..."
my_id.line1[7]="PLEASE BE DISCRETE!"
my_id.line2[7]="*CLICK*"
my_id.messages=7
global.done=1
}
}

if room=rmHighballer {
my_id.sprite=sprWileyFace
objEffector.image_xscale=1.5
objEffector.image_yscale=1.5
with objEffector sprite=sprWileyFace
my_id.line1[0]="Salut, je suis"
my_id.line2[0]="Wiley Wiggins!"
my_id.line1[1]="Bienvenue a FANTASTIC"
my_id.line2[1]="ARCADE!"
my_id.messages=1
}

if room=rmSequence3 {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="YOU HAVE ONE NEW MESSAGE!"
my_id.line2[0]="*BEEP*"
my_id.line1[1]="This is 'Thomas' from the"
my_id.line2[1]="methadone clinic."
my_id.line1[2]="We've scheduled a short"
my_id.line2[2]="meeting for you tonight."
my_id.line1[3]="We're at NW 184th Street,"
my_id.line2[3]="Apt 105. And don't worry..."
my_id.line1[4]="We know discretion is of"
my_id.line2[4]="importance to our clients."
my_id.line1[5]="..."
my_id.line2[5]="*CLICK*"
my_id.messages=5
global.done=1
}
}



if room=rmSequence4 {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="Hi, it's 'Kate' from Hotline"
my_id.line2[0]="Miami's Dating Service."
my_id.line1[1]="We have set up a date for"
my_id.line2[1]="you this evening."
my_id.line1[2]="SHE'LL BE WAITING FOR YOU"
my_id.line2[2]="AT SOUTHWEST 53rd PLACE."
my_id.line1[3]="As usual, make sure you"
my_id.line2[3]="wear something fancy."
my_id.line1[4]="..."
my_id.line2[4]="*CLICK*"
my_id.messages=4
global.done=1
}
}




if room=rmSequence5  {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="Good evening!"
my_id.line2[0]="This is 'Blake' speaking."
my_id.line1[1]="We have a job for you."
my_id.line2[1]="There's a power outage..."
my_id.line1[2]="Over on 24th NE St. We want"
my_id.line2[2]="you to take care of it."
my_id.line1[3]="We already sent someone"
my_id.line2[3]="over a while ago..."
my_id.line1[4]="But it seems he didn't"
my_id.line2[4]="do a very good job."
my_id.line1[5]="Head over there right away!"
my_id.line2[5]="They're expecting you."
my_id.line1[6]="Keep it quick and clean!"
my_id.line2[6]="*CLICK*"
my_id.messages=6
global.done=1
}
}

if room=rmSequence7Downstairs {
my_id.sprite=sprDennisFace
my_id.indexspeed=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprDennisFace}
my_id.line1[0]="..."
my_id.line2[0]=""
my_id.messages=0
}

if room=rmHotelSuite {
my_id.sprite=sprJonatanFace
my_id.indexspeed=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprJonatanFace}
my_id.line1[0]="..."
my_id.line2[0]=""
my_id.messages=0
}

if room=rmSequence6 {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="IT'S 'DAVE' FROM MIAMI PEST"
my_id.line2[0]="CONTROL. WE NEED YOU."
my_id.line1[1]="A CLIENT AT SW 104th STREET"
my_id.line2[1]="IS HAVING VERMIN PROBLEMS."
my_id.line1[2]="TRY TO HANDLE IT AS QUICK"
my_id.line2[2]="AND SWIFT AS YOU CAN."
my_id.line1[3]="SOMEONE ELSE WILL CLEAN UP"
my_id.line2[3]="FOR YOU AFTER YOU LEAVE."
my_id.line1[4]="Make sure not to bother any"
my_id.line2[4]="of the neighbors."
my_id.line1[5]="..."
my_id.line2[5]="*CLICK*"
my_id.messages=5
global.done=1
}
}

if room=rmSequence7  {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="Hi it's 'Don' from Hotel"
my_id.line2[0]="Blue, we need you tonight!"
my_id.line1[1]="Our receptionist went home"
my_id.line2[1]="due to stomach problems..."
my_id.line1[2]="And we have som VIPs who'll"
my_id.line2[2]="be staying with us today!"
my_id.line1[3]="Make sure you give them a"
my_id.line2[3]="great stay..."
my_id.line1[4]="That will be your top"
my_id.line2[4]="priority this evening!"
my_id.line1[5]="Now get going!"
my_id.line2[5]="*CLICK*"
my_id.messages=5
global.done=1
}
}

if room=rmSequence8  {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="It's 'Harry' from management."
my_id.line2[0]="We have a problem!"
my_id.line1[1]="There's big mess over by"
my_id.line2[1]="the condos on 122nd SE st!"
my_id.line1[2]="One of the residents' water"
my_id.line2[2]="pipe burst, wet all over!"
my_id.line1[3]="The whole building is gonna"
my_id.line2[3]="be flooded soon..."
my_id.line1[4]="Hope you can get on this"
my_id.line2[4]="shit ASAP... Don't go easy"
my_id.line1[5]="on the mop!"
my_id.line2[5]="*CLICK*"
my_id.messages=5
global.done=1
}
}

if room=rmSequence10  {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="Hello there, this is 'Thomas'"
my_id.line2[0]="from the 'DOWNTOWN RELAXATION'."
my_id.line1[1]="We need you to fill in at"
my_id.line2[1]="the reception tonight."
my_id.line1[2]="One of our employees has"
my_id.line2[2]="'called in sick'."
my_id.line1[3]="Wear something fitting"
my_id.line2[3]="and discrete."
my_id.line1[4]="..."
my_id.line2[4]="*CLICK*"
my_id.messages=4
global.done=1
}
}


if room=rmSequence9 {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="Hi, it's 'Pat' from The Club."
my_id.line2[0]="We want you to DJ tonight."
my_id.line1[1]="YOU'RE FREE TO PLAY ANY"
my_id.line2[1]="KIND OF MUSIC YOU WANT."
my_id.line1[2]="BEER IS ON THE HOUSE!"
my_id.line2[2]=""
my_id.line1[3]="We're on 212 NE 24th Street."
my_id.line2[3]="Dress to kill! See ya..."
my_id.line1[4]="..."
my_id.line2[4]="*CLICK*"
my_id.messages=4
global.done=1
}
}

if room=rmSequence12  {
if argument0=objAnsweringMachine {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="This is 'Jim' from the"
my_id.line2[0]="'office'... *AHEM*"
my_id.line1[1]="Just wanted to remind you"
my_id.line2[1]="that your 'report' is due"
my_id.line1[2]="tomorrow morning. Have it"
my_id.line2[2]="on my desk by eight."
my_id.line1[3]="312 SE st. is the address,"
my_id.line2[3]="in case you forgot..."
my_id.line1[4]="..."
my_id.line2[4]="*CLICK*"
my_id.line1[5]="*CLICK*"
my_id.line2[5]="*CLICK-CLICK*"
my_id.line1[6]="*CLICK* *CLICK*"
my_id.line2[6]="*CLICK*"
my_id.line1[7]="..."
my_id.line2[7]=""
my_id.line1[8]="*CLICK* *CLICK* *CLICK*"
my_id.line2[8]="*CLICK* *CLICK* *CLICK*"
my_id.line1[9]="..."
my_id.line2[9]="*CLICK*"
my_id.messages=9
global.done=1
}
}

if room=rmSequence12b  {
if argument0=0 {
my_id.sprite=sprAssassinRatFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprAssassinRatFace}
if argument0=0 {
my_id.line1[0]="Ah, there you are!"
my_id.line2[0]="..."
my_id.line1[1]="I was wondering when"
my_id.line2[1]="you'd be getting back."
my_id.line1[2]="Well, let's get this"
my_id.line2[2]="over with then..."
my_id.messages=2
}
}
}


if room=rmOfficeEntrance  {
if argument0=0 {
my_id.sprite=sprBoss3Face
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBoss3Face}
if argument0=0 {
my_id.line1[0]="J'abandonne! Vous gagnez!"
my_id.line2[0]="..."
my_id.messages=0
}
}
}


if room=rmDream1 {
my_id.indexspeed=0
if argument0=0 {
my_id.sprite=sprDreamPeople
my_id.index=1
with objLight {
if color=c_aqua targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="AND WHO DO WE HAVE HERE?"
my_id.line2[0]=""
my_id.line1[1]="OH, YOU DON'T KNOW"
my_id.line2[1]="WHO YOU ARE..?"
my_id.line1[2]="MAYBE WE SHOULD LEAVE"
my_id.line2[2]="IT THAT WAY?"
my_id.messages=2
}
if argument0=1 {
my_id.sprite=sprDreamPeople
my_id.index=0
with objLight {
if color=c_yellow targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="BUT I KNOW YOU."
my_id.line2[0]=""
my_id.line1[1]="Look at my face."
my_id.line2[1]="WE'VE MET BEFORE..."
my_id.line1[2]="HAVEN'T WE?"
my_id.line2[2]=""
my_id.messages=2
}
if argument0=2 {
my_id.sprite=sprDreamPeople
my_id.index=2
with objLight {
if color=c_red targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="I don't know you!"
my_id.line2[0]=""
my_id.line1[1]="Why are you here?"
my_id.line2[1]=""
my_id.line1[2]="You're no guest"
my_id.line2[2]="of mine!"
my_id.messages=2
}
if argument0=3 {
my_id.sprite=sprDreamPeople
my_id.index=1
with objLight {
if color=c_aqua targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="Do you really want me to"
my_id.line2[0]="reveal who you are?"
my_id.line1[1]="Knowing oneself means"
my_id.line2[1]="acknowledging ones actions."
my_id.line1[2]="As of lately you've done "
my_id.line2[2]="some terrible things..."
my_id.messages=2
}

if argument0=4 {
my_id.sprite=sprDreamPeople
my_id.index=0
with objLight {
if color=c_yellow targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="You don't remember me?"
my_id.line2[0]="I'll give you a clue..."
my_id.line1[1]="Does April the 3rd mean"
my_id.line2[1]="anything to you?"
my_id.line1[2]="I believe that was the day"
my_id.line2[2]="of our first encounter."
my_id.line1[3]="You look like you might be"
my_id.line2[3]="remembering something..."
my_id.line1[4]="..."
my_id.line2[4]=""
my_id.messages=4
}

}


if room=rmDream2 {
my_id.indexspeed=0
if argument0=0 {
my_id.sprite=sprDreamPeople
my_id.index=1
with objLight {
if color=c_aqua targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="Oh, it's you again..."
my_id.line2[0]=""
my_id.line1[1]="It looks like you've been"
my_id.line2[1]="busy since we last met."
my_id.messages=1
}
if argument0=1 {
my_id.sprite=sprDreamPeople
my_id.index=0
with objLight {
if color=c_yellow targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="I see that you remember me"
my_id.line2[0]="now. Don't you?"
my_id.line1[1]="But you still don't know"
my_id.line2[1]="who I am."
my_id.line1[2]="You don't even know who"
my_id.line2[2]="introduced us, do you?"
my_id.messages=2
}
if argument0=2 {
my_id.sprite=sprDreamPeople
my_id.index=2
with objLight {
if color=c_red targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="Why did you come back here?"
my_id.line2[0]=""
my_id.line1[1]="You're not a nice person, "
my_id.line2[1]="are you?"
my_id.line1[2]="You make me sick!"
my_id.line2[2]=""
my_id.messages=2
}
if argument0=3 {
my_id.sprite=sprDreamPeople
my_id.index=1
with objLight {
if color=c_aqua targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="A picture is starting to"
my_id.line2[0]="take form here..."
my_id.line1[1]="I wonder if it's accurate."
my_id.line2[1]=""
my_id.line1[2]="Some pieces don't quite"
my_id.line2[2]="seem to fit."
my_id.line1[3]="Or maybe I just don't"
my_id.line2[3]="like the way it looks."
my_id.messages=3
}

if argument0=4 {
my_id.sprite=sprDreamPeople
my_id.index=0
with objLight {
if color=c_yellow targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="I think our time is up..."
my_id.line2[0]="But we'll meet again."
my_id.line1[1]="Before you go, here's"
my_id.line2[1]="four questions to ponder."
my_id.line1[2]="Question number one:"
my_id.line2[2]=""
my_id.line1[3]="Do you like hurting other"
my_id.line2[3]="people?"
my_id.line1[4]="Question number two:"
my_id.line2[4]=""
my_id.line1[5]="Who are leaving messages"
my_id.line2[5]="on your answering machine?"
my_id.line1[6]="Question number three:"
my_id.line2[6]=""
my_id.line1[7]="Where are you right now?"
my_id.line2[7]=""
my_id.line1[8]="And the final question:"
my_id.line2[8]=""
my_id.line1[9]="Why are we having this"
my_id.line2[9]="conversation?"
my_id.line1[10]="That's all for now."
my_id.line2[10]="See you soon..."
my_id.messages=10
}

}




if room=rmDream3 {
my_id.indexspeed=0
if argument0=0 {
my_id.sprite=sprDreamPeople
my_id.index=1
with objLight {
if color=c_aqua targetstrength=1 else targetstrength=0
}

with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="So, you came back?"
my_id.line2[0]=""
my_id.line1[1]="How are you feeling?"
my_id.line2[1]="You look ill..."
my_id.line1[2]="Maybe you should see"
my_id.line2[2]="a doctor?"
my_id.messages=2
}
if argument0=1 {
my_id.sprite=sprDreamPeople
my_id.index=2
with objLight {
if color=c_red targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="I told you not to come"
my_id.line2[0]="back here!"
my_id.line1[1]="I see that my opinion of"
my_id.line2[1]="you doesn't matter..."
my_id.line1[2]="If you insist on returning"
my_id.line2[2]="here, then I should leave!"
my_id.messages=2
}
if argument0=2 {
my_id.sprite=sprDreamPeople
my_id.index=0
with objLight {
if color=c_yellow targetstrength=1 else targetstrength=0
}

with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="Have you thought about"
my_id.line2[0]="what I asked you last time?"
my_id.line1[1]="I'm not here to give you"
my_id.line2[1]="any answers..."
my_id.line1[2]="Questions are all I have"
my_id.line2[2]="to offer a man like you."
my_id.messages=2
}
if argument0=3 {
my_id.sprite=sprDreamPeople
my_id.index=1
with objLight {
if color=c_aqua targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="If you're not feeling well,"
my_id.line2[0]="maybe you should rest?"
my_id.line1[1]="Some things work out best"
my_id.line2[1]="when you don't try so hard."
my_id.line1[2]="No matter who you are,"
my_id.line2[2]="Bearing too much weight..."
my_id.line1[3]="inevitably leads to the"
my_id.line2[3]="collapse of everything."
my_id.messages=3
}

if argument0=4 {
my_id.sprite=sprDreamPeople
my_id.index=0
with objLight {
if color=c_yellow targetstrength=1 else targetstrength=0
}
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}

my_id.line1[0]="Next time we meet will"
my_id.line2[0]="be the last. "
my_id.line1[1]="I can see it in your eyes."
my_id.line2[1]=""
my_id.line1[2]="Before you go I'll leave you"
my_id.line2[2]="with three predictions..."
my_id.line1[3]="'Someone you know is not"
my_id.line2[3]="who you think he is.'"
my_id.line1[4]="'Something will soon be"
my_id.line2[4]="taken from you.'"
my_id.line1[5]="'On July the 21st you will"
my_id.line2[5]="wake up in a bigger house.'"
my_id.line1[6]="That is all."
my_id.line2[6]="..."
my_id.messages=6
}
}



if room=rmSequence12c {
if argument0=0 {
my_id.indexspeed=0
my_id.sprite=sprDreamPeople
my_id.index=3
with objEffector {image_xscale=1.5 image_yscale=1.5  sprite=sprDreamPeople}
my_id.line1[0]="Looks like it's only"
my_id.line2[0]="you and me left now..."
my_id.line1[1]="I'm sure you know by now,"
my_id.line2[1]="that this won't end well."
my_id.line1[2]="Soon you will be all alone."
my_id.line2[2]="But that's okay."
my_id.line1[3]="Before we say goodbye, I'll"
my_id.line2[3]="let you in on a secret..."
my_id.line1[4]="What you do from here on,"
my_id.line2[4]="won't serve any purpose."
my_id.line1[5]="You will never see the"
my_id.line2[5]="whole picture..."
my_id.line1[6]="And it's all your own fault."
my_id.line2[6]="..."
my_id.line1[7]="Now it's time for "
my_id.line2[7]="you to leave."
my_id.line1[8]="There's a warm bed across"
my_id.line2[8]="the hall from here..."
my_id.line1[9]="And you look like you"
my_id.line2[9]="could use some rest."
my_id.messages=9
}
}



if room=rmBuildingFloor4 {
if argument0=0 {
my_id.sprite=sprPhone
my_id.index=0
with objEffector sprite=sprPhone
my_id.line1[0]="IL Y A EU UN PETIT"
my_id.line2[0]="CHANGEMENT DE PLANS..."
my_id.line1[1]="NOUS AVONS UN APPELANT DE FARCE"
my_id.line2[1]="� LA COMPAGNIE DE T�L�PHONE."
my_id.line1[2]="POURQUOI NE PAS Y ALLER ET "
my_id.line2[2]="VOIR SI VOUS ..."
my_id.line1[3]="PEUT PARLER DES SENS AVEC LUI."
my_id.line2[3]="VOUS SAVEZ CE QUE JE VEUX DIRE."
my_id.line1[4]="342ND ST. NW ALLEZ Y MAINTENANT!"
my_id.line2[4]="D�p�che-toi!"
my_id.line1[5]="..."
my_id.line2[5]="*CLICK*"
my_id.messages=5
}
}

if room=rmPhoneHomUpstairs {
if argument0=0 {
my_id.sprite=sprBiker
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBiker}
my_id.line1[0]="..."
my_id.line2[0]=""
my_id.messages=0
}
if argument0=1 {
my_id.sprite=sprBikerHurt
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBikerHurt}
my_id.line1[0]="CE... CELA NE PEUT."
my_id.line2[0]="SE PASSER.."
my_id.line1[1]="L NE PEUT PAS METTRE FIN "
my_id.line2[1]="MAINTENANT. PAS COMME �A..."
my_id.line1[2]="JE SUIS SI PROCHE..."
my_id.line2[2]="*TOUX*"
my_id.messages=2
}
}

if room=rmStore1 {
if argument0=0 {
my_id.sprite=sprNicklasStoreFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasStoreFace}
my_id.line1[0]="Hi there, man! "
my_id.line2[0]="Haven't seen you around."
my_id.line1[1]="Thought something might"
my_id.line2[1]="have happened to you."
my_id.line1[2]="You seemed really down over"
my_id.line2[2]="losing your girlfriend."
my_id.line1[3]="Don't remember seeing"
my_id.line2[3]="you after that..."
my_id.line1[4]="..."
my_id.line2[4]=""
my_id.line1[5]="Maybe we should talk"
my_id.line2[5]="about something else..."
my_id.line1[6]="So, out for a midnight"
my_id.line2[6]="snack, huh?"
my_id.line1[7]="Oh, don't worry about it."
my_id.line2[7]="It's on the house..."
my_id.line1[8]="Good to see you!"
my_id.line2[8]="Have a nice night!"
my_id.messages=8
}
}

if room=rmPizzaHut1 {
if argument0=0 {
my_id.sprite=sprNicklasPizzaFace
my_id.index=1
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasPizzaFace}
my_id.line1[0]="Hi there, welcome!"
my_id.line2[0]=""
my_id.line1[1]="Oh, you don't need to order,"
my_id.line2[1]="your pizza's already done."
my_id.line1[2]="Had a feelin you were on"
my_id.line2[2]="your way here, heh..."
my_id.line1[3]="Well, let's just leave it at"
my_id.line2[3]="that for now, shall we?"
my_id.line1[4]="Don't worry about paying,"
my_id.line2[4]="it's on the house!"
my_id.messages=4
}
}

if room=rmVideoStore1 {
if argument0=0 {
my_id.sprite=sprNicklasVideoFace
my_id.index=2
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasVideoFace}
my_id.line1[0]="Hey dude!"
my_id.line2[0]="Good to see you again!"
my_id.line1[1]="Did you hear about the"
my_id.line2[1]="'massacre' the other night?"
my_id.line1[2]="A bunch of ruskies I heard."
my_id.line2[2]="No loss, if you ask me!"
my_id.line1[3]="They say some maniac wearing"
my_id.line2[3]="a rubber mask did it!"
my_id.line1[4]="Sounds like a scene straight"
my_id.line2[4]="from a slasher flick, heh!"
my_id.line1[5]="Oh yeah, I have the perfect"
my_id.line2[5]="film for you!"
my_id.line1[6]="The one on the desk..."
my_id.line2[6]="Take it! It's on the house."
my_id.line1[7]="Enjoy yourself, dude!"
my_id.line2[7]=""
my_id.messages=7
}
}

if room=rmBar1 {
if argument0=0 {
my_id.sprite=sprNicklasBarFace
my_id.index=3
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasBarFace}
my_id.line1[0]="Hi there, welcome!"
my_id.line2[0]="..."
my_id.line1[1]="You don't look well, sir."
my_id.line2[1]="Are you alright?"
my_id.line1[2]="Are you sure it is ok for"
my_id.line2[2]="you to be drinking?"
my_id.line1[3]="Alright... Then I will get"
my_id.line2[3]="you something special."
my_id.line1[4]="Do you like sweet or sour?"
my_id.line2[4]="Maybe you want it bitter?"
my_id.line1[5]="And there you go, sir!"
my_id.line2[5]="Enjoy!"
my_id.messages=5
}
}

if room=rmTutorial {
if argument0=0 {
my_id.sprite=sprHoboFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprHoboFace}
my_id.line1[0]="I'm here to tell you how"
my_id.line2[0]="to kill people."
my_id.line1[1]="This game is controlled with"
my_id.line2[1]="your WASD-keys and MOUSE."
my_id.line1[2]="Press the left mouse button"
my_id.line2[2]="to punch. Aim for the face!"
my_id.line1[3]="Once you've knocked someone"
my_id.line2[3]="out you have to finish him!"
my_id.line1[4]="To do this you press space."
my_id.line2[4]="You got it? Are you sure?"
my_id.line1[5]="Left mouse button to punch!"
my_id.line2[5]="Space to finish!"
my_id.line1[6]="Do you understand me?"
my_id.line2[6]="Don't mess this up!"
my_id.messages=6
}

if argument0=2 {
my_id.sprite=sprHoboFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprHoboFace}
my_id.line1[0]="Alright, now you should try"
my_id.line2[0]="killing the next guy."
my_id.line1[1]="But use the bat in the"
my_id.line2[1]="red room over here, ok?"
my_id.line1[2]="Press the right mouse button"
my_id.line2[2]="when next to it to take it."
my_id.line1[3]="Then you press the left"
my_id.line2[3]="mouse button to swing it!"
my_id.line1[4]="Did that get through your"
my_id.line2[4]="thick skull? Did it?"
my_id.line1[5]="Right mouse to pick up!"
my_id.line2[5]="Left mouse to swing it!"
my_id.line1[6]="Are you even listening?"
my_id.line2[6]="Well get to it then!"
my_id.messages=6
}

if argument0=4 {
my_id.sprite=sprHoboFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprHoboFace}
my_id.line1[0]="Well done! so let's get"
my_id.line2[0]="to the guns, shall we?"
my_id.line1[1]="You go and get the shotgun"
my_id.line2[1]="in the blue room."
my_id.line1[2]="You do it the same way you"
my_id.line2[2]="picked up the bat..."
my_id.line1[3]="Just press the right mouse"
my_id.line2[3]="button, can you handle that?"
my_id.line1[4]="Use the shift button to look "
my_id.line2[4]="for enemies out of view!"
my_id.line1[5]="It is very useful for not"
my_id.line2[5]="getting yourself killed!"
my_id.line1[6]="You can press the scroll"
my_id.line2[6]="wheel to lock on to enemies."
my_id.line1[7]="Just make sure to place your"
my_id.line2[7]="crosshair over them first!"
my_id.line1[8]="Right mouse button to grab!"
my_id.line2[8]="Shift to look!"
my_id.line1[9]="Left mouse button to shoot!"
my_id.line2[9]="Scroll wheel to lock on!"
my_id.line1[10]="Now go ahead and show me"
my_id.line2[10]="you've been listening!"

my_id.messages=10
}

if argument0=7 {
my_id.sprite=sprHoboFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprHoboFace}
my_id.line1[0]="Alright, that about sums"
my_id.line2[0]="up the basics. However..."
my_id.line1[1]="There's always more tricks"
my_id.line2[1]="to learn!"
my_id.line1[2]="You can throw any weapon"
my_id.line2[2]="you pick up..."
my_id.line1[3]="By pressing your right"
my_id.line2[3]="mouse button."
my_id.line1[4]="You can use doors to"
my_id.line2[4]="knock enemies over."
my_id.line1[5]="Guns are very loud, and will"
my_id.line2[5]="alert your foes."
my_id.line1[6]="So plan your moves and use"
my_id.line2[6]="melee weapons when you can."
my_id.line1[7]="Goddamn it, you'll just get"
my_id.line2[7]="yourself killed anyway..."
my_id.line1[8]="Won't you?"
my_id.line2[8]="..."
my_id.messages=8
}
}

if room=rmPoliceHQFloor3 {
if argument0=0 {
my_id.sprite=sprChiefFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprChiefFace}
my_id.line1[0]="OK, gar�ons ! Le b�tard sera"
my_id.line2[0]="ici toute seconde maintenant."
my_id.line1[1]="Il est temps pour nous de lui"
my_id.line2[1]="montrer de quoi nous sommes faits!"
my_id.line1[2]="N'oubliez pas votre formation et"
my_id.line2[2]="jouer en toute s�curit�!"
my_id.line1[3]="Protocole suivi et nous"
my_id.line2[3]="allons tous font des vivants!"
my_id.messages=3
}
if argument0=1 {
my_id.sprite=sprAssassinFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprAssassinFace}
my_id.line1[0]="QUI DIABLE �TES VOUS ? "
my_id.line2[0]="Oh, attendez une seconde..."
my_id.line1[1]="..."
my_id.line2[1]="Regardez, homme..."
my_id.line1[2]="e suis d�sol� de votre fille."
my_id.line2[2]="Ce n'est pas personnel."
my_id.line1[3]="Je sais que vous le faites"
my_id.line2[3]="tout le chemin mais ici..."
my_id.line1[4]="Je pense que vous �tes"
my_id.line2[4]="dans une d�ception."
my_id.line1[5]="Vraiment ai pas de"
my_id.line2[5]="r�ponses pour vous."
my_id.messages=5
}

if argument0=2 {
my_id.sprite=sprAssassinFace
my_id.index=1
with objFiles on=1
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprAssassinFace}
my_id.line1[0]="Merde, que bless�!"
my_id.line2[0]="... *Toux*"
my_id.line1[1]="je pense que nous peut-�tre"
my_id.line2[1]="pas si diff�rents vous et moi."
my_id.line1[2]="Vous aussi obtiennent tuyau "
my_id.line2[2]="d'appels t�l�phoniques foutu?"
my_id.line1[3]="..."
my_id.line2[3]="*TOUX*"
my_id.line1[4]="je tiens j'avais quelque chose"
my_id.line2[4]="� vous dire... Je n'est pas."
my_id.line1[5]="La police semble en savoir plus"
my_id.line2[5]="sur ce d�sordre que moi."
my_id.line1[6]="Ils ont probablement un dossier"
my_id.line2[6]="de l'affaire ici quelque part."
my_id.line1[7]="Je vous demande d'�pargner"
my_id.line2[7]="ma vie, mais... *toux*"
my_id.line1[8]="vous ressembler vous avez"
my_id.line2[8]="constitu� votre esprit..."
my_id.messages=8
}

if argument0=3 {
my_id.sprite=sprAssassinFace
my_id.index=2
with objFiles on=1
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprAssassinFace}
my_id.line1[0]="Merde, que bless�!"
my_id.line2[0]="... *Toux*"
my_id.line1[1]="je pense que nous peut-�tre"
my_id.line2[1]="pas si diff�rents vous et moi."
my_id.line1[2]="Vous aussi obtiennent tuyau "
my_id.line2[2]="d'appels t�l�phoniques foutu?"
my_id.line1[3]="..."
my_id.line2[3]="*TOUX*"
my_id.line1[4]="je tiens j'avais quelque chose"
my_id.line2[4]="� vous dire... Je n'est pas."
my_id.line1[5]="La police semble en savoir plus"
my_id.line2[5]="sur ce d�sordre que moi."
my_id.line1[6]="Ils ont probablement un dossier"
my_id.line2[6]="de l'affaire ici quelque part."
my_id.line1[7]="Je vous demande d'�pargner"
my_id.line2[7]="ma vie, mais... *toux*"
my_id.line1[8]="vous ressembler vous avez"
my_id.line2[8]="constitu� votre esprit..."
my_id.messages=8
}
}




if room=rmStore2 {
if argument0=0 {
my_id.sprite=sprNicklasStoreFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasStoreFace}
my_id.line1[0]="Oh, hi there!"
my_id.line2[0]="Good to see you!"
my_id.line1[1]="I was a bit worried"
my_id.line2[1]="about you..."
my_id.line1[2]="The city streets don't seem"
my_id.line2[2]="so safe anymore, y'know?"
my_id.line1[3]="What with all the killings"
my_id.line2[3]="and all that I mean."
my_id.line1[4]="Don't worry about paying."
my_id.line2[4]="You're my friend..."
my_id.line1[5]="Your money's no good here."
my_id.line2[5]="Now have a nice night!"
my_id.messages=5
}
}

if room=rmPizzaHut2 {
if argument0=0 {
my_id.sprite=sprNicklasPizzaFace
my_id.index=1
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasPizzaFace}
my_id.line1[0]="Good evening!"
my_id.line2[0]="How are you doing?"
my_id.line1[1]="You look a bit distracted,"
my_id.line2[1]="something got you worried?"
my_id.line1[2]="These are harsh times we're"
my_id.line2[2]="living in, I know."
my_id.line1[3]="Haven't seen many customers"
my_id.line2[3]="lately..."
my_id.line1[4]="Maybe they've lost their"
my_id.line2[4]="taste for pizza..."
my_id.line1[5]="Maybe it's time to close"
my_id.line2[5]="shop once and for all."
my_id.line1[6]="Anyway, got your order"
my_id.line2[6]="right here."
my_id.line1[7]="Take care now!"
my_id.line2[7]=""
my_id.messages=7
}
}

if room=rmAlley {
if argument0=0 {
my_id.sprite=sprHoboFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprHoboFace}
my_id.line1[0]="Qui est la ? Je peux vous"
my_id.line2[0]="entendre! Je sais vous y etes!"
my_id.messages=0
}
}

if room=rmHospitalTopFloor or room=rmHospitalEntrance {
if argument0=0 {
my_id.sprite=sprDoctorFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprDoctorFace}
my_id.line1[0]="Hey! Hold it right there!"
my_id.line2[0]="You're not allowed out here."
my_id.line1[1]="Get back to your room, now!"
my_id.line2[1]="Before I call security!"
my_id.messages=1
}
if argument0=1 {
my_id.sprite=sprPoliceFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprPoliceFace}
my_id.line1[0]="Hey! Where do you think"
my_id.line2[0]="you're going, prick?"
my_id.line1[1]="I guess we better put"
my_id.line2[1]="restraints on you!"
my_id.messages=1
}
}


if room=rmHospitalCutscene {

if argument0=0 {
my_id.sprite=sprPoliceFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprPoliceFace}
my_id.line1[0]="Hey, doc! When's this"
my_id.line2[0]="bastard going to wake up?"
my_id.messages=0
}
if argument0=1 {
my_id.sprite=sprDoctorFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprDoctorFace}
my_id.line1[0]="I don't know... He's been"
my_id.line2[0]="in a coma for weeks now."
my_id.messages=0
}
if argument0=2 {
my_id.sprite=sprPoliceFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprPoliceFace}
my_id.line1[0]="But he is going to"
my_id.line2[0]="wake up... right?"
my_id.line1[1]="This guy is a prime suspect"
my_id.line2[1]="in a major case!"
my_id.messages=1
}
if argument0=3 {
my_id.sprite=sprDoctorFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprDoctorFace}
my_id.line1[0]="Look, my guess is as good"
my_id.line2[0]="as yours!"
my_id.line1[1]="Though I can say that it"
my_id.line2[1]="might be a while. *sigh*"
my_id.line1[2]="He's still not even fully"
my_id.line2[2]="healed from the surgery..."
my_id.messages=2
}
if argument0=4 {
my_id.sprite=sprPoliceFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprPoliceFace}
my_id.line1[0]="Is there nothing you can"
my_id.line2[0]="do? We need this guy!"
my_id.line1[1]="You people weren't able to"
my_id.line2[1]="save his girlfriend..."
my_id.line1[2]="I mean, we've got the perp"
my_id.line2[2]="who shot 'em in the locker."
my_id.line1[3]="But that asshole ain't"
my_id.line2[3]="saying shit!"
my_id.messages=3
}
if argument0=5 {
my_id.sprite=sprDoctorFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprDoctorFace}
my_id.line1[0]="And what makes you think"
my_id.line2[0]="this guy will..?"
my_id.messages=0
}
}


if room=rmVideoStore2 {
if argument0=0 {
my_id.sprite=sprNicklasVideoFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasVideoFace}
my_id.line1[0]="Hey, my man!"
my_id.line2[0]="Boy, am I glad to see you!"
my_id.line1[1]="Have you been following the"
my_id.line2[1]="news? About the killings?"
my_id.line1[2]="Now this is top secret!"
my_id.line2[2]="You can't tell anyone..."
my_id.line1[3]="But I have a friend who's"
my_id.line2[3]="in the police force."
my_id.line1[4]="He told me there's rumours"
my_id.line2[4]="going around..."
my_id.line1[5]="There could be more than one"
my_id.line2[5]="perp! Maybe a whole bunch!"
my_id.line1[6]="A group of people wearing"
my_id.line2[6]="masks killing russians!"
my_id.line1[7]="It's like it's from a movie"
my_id.line2[7]="or something, right?"
my_id.line1[8]="Well, I think it's"
my_id.line2[8]="fascinating!"
my_id.line1[9]="Right... So just grab any"
my_id.line2[9]="movie you want!"
my_id.line1[10]="It's on the house! That's"
my_id.line2[10]="what friends are for!"
my_id.messages=10
}
}

if room=rmBar2 {
if argument0=0 {
my_id.sprite=sprNicklasFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasBarFace}
my_id.line1[0]="Welcome back, sir!"
my_id.line2[0]="..."
my_id.line1[1]="How are you tonight?"
my_id.line2[1]="You don't look so happy."
my_id.line1[2]="To be honest, I don't feel"
my_id.line2[2]="too good either."
my_id.line1[3]="Something in the air..."
my_id.line2[3]="I don't know..."
my_id.line1[4]="I just have this really"
my_id.line2[4]="bad feeling. Like..."
my_id.line1[5]="Like something terrible"
my_id.line2[5]="has happened tonight."
my_id.line1[6]="I haven't felt this way"
my_id.line2[6]="since San Francisco..."
my_id.line1[7]="I don't like it."
my_id.line2[7]="Not one bit."
my_id.line1[8]="So, how about a drink?"
my_id.line2[8]="It's on me."
my_id.messages=8
}
}

if room=rmStore3 {

if argument0=0 {
my_id.sprite=sprNicklasStoreFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasStoreFace}
my_id.line1[0]="Hey, man! I gotta tell ya"
my_id.line2[0]="something important..."
my_id.line1[1]="This... All of this is"
my_id.line2[1]="not really happening."
my_id.line1[2]="Take a look..."
my_id.line2[2]=""
my_id.messages=2
}

if argument0=1 {
my_id.sprite=sprBikerDestroyedFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBikerDestroyedFace}
my_id.line1[0]="*GURGLE* *GURGLE*"
my_id.line2[0]="..."
my_id.messages=0
}

if argument0=2 {
my_id.sprite=sprNicklasStoreFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasStoreFace}
my_id.line1[0]="What you saw just now,"
my_id.line2[0]="did not actually happen."
my_id.line1[1]="You don't look like you"
my_id.line2[1]="believe me..."
my_id.line1[2]="Then, allow me to"
my_id.line2[2]="demonstrate!"
my_id.messages=2
}

if argument0=3 {
my_id.sprite=sprNicklasStoreFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprNicklasStoreFace}
my_id.line1[0]="Hey man! Nice to see"
my_id.line2[0]="you..."
my_id.line1[1]="Friendly faces are few and"
my_id.line2[1]="far between these days."
my_id.line1[2]="Just take what you"
my_id.line2[2]="want, my treat."
my_id.line1[3]="Have a good night, man!"
my_id.line2[3]="See ya!"
my_id.messages=3
}
}

if room=rmPizzaHut3 {
my_id.sprite=sprAssassinBloodyFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprAssassinBloodyFace}
if argument0=0 {
my_id.line1[0]="What do you want?"
my_id.line2[0]="..."
my_id.line1[1]="Could you hurry up?"
my_id.line2[1]="We're closing soon."
my_id.messages=1
}
}

if room=rmVideoStore3 {
my_id.sprite=sprAssassinBloodyFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprAssassinBloodyFace}
if argument0=0 {
my_id.line1[0]="What're you looking at?"
my_id.line2[0]="..."
my_id.line1[1]="Hey... I recognize you!"
my_id.line2[1]="You look very familiar!"
my_id.line1[2]="Have we met before?"
my_id.line2[2]="..."
my_id.messages=2
}
}

if room=rmMansionMainHall {
if argument0=0 {
my_id.sprite=sprBoss4Face
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBoss4Face}
my_id.line1[0]="ET QUI AVONS-NOUS ICI?"
my_id.line2[0]="..."
my_id.line1[1]="VOUS DEVEZ �TRE UN DU CUL"
my_id.line2[1]="TUER MES HOMMES."
my_id.line1[2]="NE RESSEMBLE QUE VOUS "
my_id.line2[2]="�TES ICI POUR CHAT..."
my_id.line1[3]="ALORS POURQUOI NE NOUS"
my_id.line2[3]="OBTENONS CECI AVEC?"
my_id.messages=3
}

if argument0=1 {
my_id.sprite=sprBoss4Face
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBoss4Face}
my_id.line1[0]="JE SUPPOSE QUE C'EST JUSTE "
my_id.line2[0]="TOI ET MOI � GAUCHE MAINTENANT."
my_id.line1[1]="Pas mal!  "
my_id.line2[1]="JE SUIS IMPRESSIONN�E!"
my_id.line1[2]="QUE JE ME DEMANDE CE QUI VOUS"
my_id.line2[2]="A DONN� CETTE SOIF DE SANG."
my_id.line1[3]="JE N'AI JAMAIS VU QUOI QUE CE"
my_id.line2[3]="SOIT TOUT � FAIT COMME ELLE!"
my_id.line1[4]="MAINTENANT JE VEUX VOIR QUI"
my_id.line2[4]="SE CACHE DERRI�RE CE MASQUE!"
my_id.messages=4
}

if argument0=2 {
my_id.sprite=sprBodyguardFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBodyguardFace}
my_id.line1[0]="LUI LAISSER ME"
my_id.line2[0]="..."
my_id.messages=0
}

if argument0=3 {
my_id.sprite=sprBoss4CrazyFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBoss4CrazyFace}
my_id.line1[0]="JE NE VOIS PAS OU CELA"
my_id.line2[0]="SE PASSE... *HE!*"
my_id.line1[1]="JE VAIS VOUS �PARGNER"
my_id.line2[1]="LE PLAISIR!"
my_id.messages=1
}

if argument0=4 {
my_id.sprite=sprPhone
with objEffector sprite=sprPhone
my_id.line1[0]="BONJOUR ...? BONJOUR!"
my_id.line2[0]="..."
my_id.line1[1]="QU'EST-CE QUI SE PASSE "
my_id.line2[1]="l�-bas? J'essaie de dormir!"
my_id.line1[2]="..."
my_id.line2[2]=""
my_id.line1[3]="Y AT-IL ya quelqu'un?"
my_id.line2[3]="POUVEZ-VOUS ME ENTENDRE?"
my_id.line1[4]="..."
my_id.line2[4]=""
my_id.line1[5]="T�l�phones putain! Je"
my_id.line2[5]="d�teste ces trucs PUTAIN!"
my_id.line1[6]="..."
my_id.line2[6]="*CLIQUEZ*"
my_id.messages=6
global.done=1
}

}

if room=rmMansionBalcony {
if argument0=0 {
my_id.sprite=sprOldmanFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprOldmanFace}
my_id.line1[0]="EUH, DONC, VOUS �TES "
my_id.line2[0]="CELLE CAUSANT CE RAFFUT?"
my_id.line1[1]="Q'EST VOTRE ENTREPRISE ICI?"
my_id.line2[1]="... *TOUX*"
my_id.line1[2]=" EN FAIT, POURQUOI NE PAS"
my_id.line2[2]="NOUS IGNORER LES D�TAILS?"
my_id.line1[3]="J'AI FAIT TELLEMENT DE"
my_id.line2[3]="CHOSES HORRIBLES..."
my_id.line1[4]="RIEN NE SEMBLE VRAIMENT"
my_id.line2[4]="D'IMPORTANCE, LE FAIT?"
my_id.line1[5]="JE VAIS PAS N'IMPORTE OU,"
my_id.line2[5]="COMME VOUS POUVEZ LE VOIR."
my_id.line1[6]="JUSTE ALLER DE L'AVANT ET "
my_id.line2[6]="FAIRE CE QUE JAMAIS VOUS"
my_id.line1[7]="�TES ARRIV� ICI � FAIRE."
my_id.line2[7]="*TOUX*"
my_id.messages=7
}
}

if room=rmBossClubFloor3 {
if argument0=0 {
my_id.sprite=sprClubOwnerFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprClubOwnerFace}
my_id.line1[0]="Regardez homme, je ne"
my_id.line2[0]="veux pas de mal ici..."
my_id.line1[1]="Le coffre est ouvert, il suffit"
my_id.line2[1]="de prendre ce que vous voulez"
my_id.line1[2]="et c'est parti."
my_id.line2[2]="..."
my_id.line1[3]="REGARDEZ, JE NE SUIS PAS LE"
my_id.line2[3]="PROPRI�TAIRE, il n'est pas l�!"
my_id.line1[4]="JE VIENS DE PASSER LE CLUB!"
my_id.line2[4]="Soyons CIVILE AU SUJET DE CE!"
my_id.messages=4
}
if argument0=1 {
my_id.sprite=sprClubOwnerScaredFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprClubOwnerScaredFace}
my_id.line1[0]="Tr�s bien! Tr�s bien! Je vais"
my_id.line2[0]="vous donner son adresse!"
my_id.line1[1]="S'IL VOUS PLA�T ne me blesse"
my_id.line2[1]="pas, d'accord?"
my_id.line1[2]="Il est SUR PLACE NE 114th."
my_id.line2[2]="..."
my_id.line1[3]="S'IL VOUS PLA�T laisser"
my_id.line2[3]="maintenant, d'accord?"
my_id.messages=3
}
}

if room=rmHouse1Downstairs {
if argument0=0 {
my_id.sprite=sprBlackGuy
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBlackGuy}
my_id.line1[0]="FAIRE TOUT PAR"
my_id.line2[0]="MOI-MEME, HEIN..."
my_id.messages=0
}
if argument0=1 {
my_id.sprite=sprBlackGuyHurt
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprBlackGuyHurt}
my_id.line1[0]="OH DIEU... *TOUX*"
my_id.line2[0]="S'IL VOUS PLAIT NE!"
my_id.messages=0
}

if argument0=2 {
my_id.sprite=sprGirlfriendFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprGirlfriendFace}
my_id.line1[0]="HE... con..."
my_id.line2[0]="VOUS NE PEUT PAS JUSTE"
my_id.line1[1]="LAISSER MOI ICI..."
my_id.line2[1]=""
my_id.line1[2]="VOUS NE PEUT PAS Je N'AI"
my_id.line2[2]="AUCUNE O� ALLER..."
my_id.line1[3]="POURQUOI NE PAS TERMINER"
my_id.line2[3]="CE QUE VOUS COMMENC�?"
my_id.messages=3
}

if argument0=3 {
my_id.sprite=sprGirlfriendFace
my_id.index=0
with objEffector {image_xscale=1.5 image_yscale=1.5 sprite=sprGirlfriendFace}
my_id.line1[0]="Ouais... JUSTe"
my_id.line2[0]="finer avec..."
my_id.line1[1]="Je savais qu'il finirait"
my_id.line2[1]="comme ca *toux*"
my_id.messages=1
}

}
