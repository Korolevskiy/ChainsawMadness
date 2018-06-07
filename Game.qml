import QtQuick 2.0


Item // Игровое окно

{


    id: board;
    width: 800
    height: 600

    Rectangle // Счётчик врагов, которых осталось убить
    {
       width: 60
       height: 50
       color: "#DC143C"
       Text
       {
           x: 8
           y: 0
           width: 42
           height: 55
            text: enemyManager.liveEnemies;
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 30
       }
    }

    Image // Фон
    {
        source: "background.png"
        fillMode: Image.Tile
        anchors.fill: parent
        z: -1;
    }

    EnemyManager // Генерация врагов
    {
        id: enemyManager

        gameBoard: board

        actorWidth: 118
        actorHeight: 118

        enemyWidth: 118
        enemyHeight: 118

        enemyNumber: 10

        Component.onCompleted: generateEnemies()

    }

    Actor // Главный герой
    {
        id: actor;
        x: parent.width / 4 - width / 2
        y: parent.height / 2 - height / 2
        z: 1
        focus: true
    }
}
