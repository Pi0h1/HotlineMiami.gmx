global.loaded=1
with objEffector {global.amount=amount amount=0}
scrSaveGame()
with objEffector {amount=global.amount}
global.loaded=0
