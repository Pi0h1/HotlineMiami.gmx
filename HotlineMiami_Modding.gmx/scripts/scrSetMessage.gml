//scrSetMessage(face,amount of messages)
//my_id refers to objPhoneConversation
        my_id.index = 0
        my_id.messages = argument1
        my_id.sprite = argument0
        with objEffector sprite= argument0
        my_id.faces[0] = argument0
        for (var i=0; i<my_id.messages;i++) {
          my_id.message[i] = undefined
          my_id.faces[i] = undefined
        }
        objEffector.image_xscale=1.5
        objEffector.image_yscale=1.5
