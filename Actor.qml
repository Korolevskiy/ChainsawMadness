import QtQuick 2.0

Item
{
    property int xVelocity: 0
    property int yVelocity: 0

    width: 118
    height: 118

    SpriteSequence
    {
        id: r
        width: 118
        height: 118
        interpolate: false

        Sprite
        {
            name: "left"
            source: "guy.png"
            frameCount: 1
            frameWidth: 1180
            frameHeight: 1180
            frameX: 0
            frameY: 300
        }

    }

    Keys.onPressed:
    {
        if (event.isAutoRepeat)
        {
            return;
        }

        switch (event.key) // Движение вверх и вниз
        {

            case Qt.Key_Up:
                if(this.y > 120)
                    this.y -= 120;
                break;
            case Qt.Key_Down:
                if(this.y < parent.height - 240)
                    this.y += 120;
                break;
        }
    }


    Timer
    {
        interval: 5
        triggeredOnStart: true
        running: true
        repeat: true

        onTriggered:
        {
            enemyManager.processCollisions(x, y)
//            parent.x += xVelocity
//            parent.y += yVelocity
              if(enemyManager.liveEnemies === 0) Qt.quit() // Выход, если счетчик оставшихся врагов равен 0
        }
    }
}
