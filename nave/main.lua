-- </Definições Globais
larguraTela = love.graphics.getWidth()
alturaTela = love.graphics.getHeight()

speedBuster = 1

-- Definições Globais />

function love.load()  
    -- </Geral
    -- Geral />

    -- </ Efeitos sonoros
    -- Efeitos sonoros />

    -- </ Background
    fundoA = love.graphics.newImage("imagens/Background.png")
    fundoB = love.graphics.newImage("imagens/Background.png")
    planoFundo =
    {
        x = 0,
        y = 0,
        y2 = 0 - fundoA:getHeight(),
        speed = 30 * speedBuster
    }    
    -- Background/>

    -- </ Nave
    imgNave = love.graphics.newImage("imagens/Nave.png")
    nave =
    {
        x = larguraTela / 2,
        y = alturaTela / 2,
        speed = 200 * speedBuster
    }    
    -- Nave/>

    -- </Inimigos
    -- Inimigos/>

    -- </Caça Inimigo
    -- Caça Inimigo/>

     -- </Ataque
   -- Ataque/>
     
   -- </Projétil
   -- Projétil/>
 
   -- </Fonte
   -- Fonte/>

   -- </Efeitos
   -- Efeitos/>
 
   -- </Explode Inimigo
   -- Explode Inimigo/>


end

function love.update(dt)
    -- </ Background
    planoFundoScroll(dt)
    -- Background/>

    -- </ Efeito do Placar
    -- Efeito do Placar/>

    -- </ Nave
    movimentacaoNave(dt)
    -- Nave/>

    -- </ Atacar (tocar o terror)
    -- Atacar/>

    -- </ Inimigo
    -- Inimigo/>

    -- </ Controle das explosoes
    -- Controle das explosoes/>
    
    -- </ Detectar Colisões
    -- Detectar Colisões/>


    -- </ Verificar se o jogador digitou r para reiniciar o jogo
    -- Verificar se o jogador digitou r para reiniciar o jogo/>    
end

function love.draw()
    -- </ Background
    love.graphics.draw(fundoA, planoFundo.x, planoFundo.y)
    love.graphics.draw(fundoB, planoFundo.x, planoFundo.y2)
    -- Background/>

    -- </ Pontos na tela
    -- Pontos na tela />

    -- </ Game over e reiniciar
    -- Game over e reiniciar />

    -- </ Nave
    love.graphics.draw(imgNave, nave.x, nave.y, 0, 1, 1, imgNave:getWidth()/2, imgNave:getHeight()/2)    
    -- Nave/>

    -- </Ataque Inimigo
    -- Ataque Inimigo/>

    -- </Explode Inimigo
    -- Explode Inimigo/>

    
    -- </Ataques
    -- Ataques/>

end

function planoFundoScroll(dt)
    planoFundo.y = planoFundo.y + planoFundo.speed * dt
    planoFundo.y2 = planoFundo.y2 + planoFundo.speed * dt    

    if planoFundo.y > alturaTela then
        planoFundo.y = planoFundo.y2 - fundoB:getHeight()
    end

    if planoFundo.y2 > alturaTela then
        planoFundo.y2 = planoFundo.y - fundoA:getHeight()
    end    
end

function movimentacaoNave(dt)
    if love.keyboard.isDown("up") then
        if nave.y > (0 + imgNave:getHeight() / 2) then
            nave.y = nave.y - (nave.speed * speedBuster) * dt
        end
    end

    if love.keyboard.isDown("down") then
        if nave.y < (alturaTela - imgNave:getHeight() / 2) then
            nave.y = nave.y + (nave.speed * speedBuster) * dt
        end
    end

    if love.keyboard.isDown("left") then
        if nave.x > (0 + imgNave:getWidth() / 2) then
            nave.x = nave.x - (nave.speed * speedBuster) * dt
        end
    end

    if love.keyboard.isDown("right") then
        if nave.x < (larguraTela - imgNave:getWidth() / 2) then
            nave.x = nave.x + (nave.speed * speedBuster) * dt
        end
    end
end
