class TicTacToe
    @@row1= [" "," "," "]
    @@row2= [" "," "," "]
    @@row3= [" "," "," "]
    @@winning= false
    @@made_play="X"
    @@player="Player1"
    @@i=1
    def self.board
        puts @@row1.inspect, @@row2.inspect, @@row3.inspect
    end
    def self.check_winning
        if  @@row1[0]==@@row1[1] && @@row1[0]==@@row1[2] && @@row1[0]!=" " ||
            @@row2[0]==@@row2[1] && @@row2[0]==@@row2[2] && @@row2[0]!=" " ||
            @@row3[0]==@@row3[1] && @@row3[0]==@@row3[2] && @@row3[0]!=" " ||
            @@row1[0]==@@row2[0] && @@row1[0]==@@row3[0] && @@row1[0]!=" " ||
            @@row1[1]==@@row2[1] && @@row1[1]==@@row3[1] && @@row1[1]!=" " ||
            @@row1[2]==@@row2[2] && @@row1[2]==@@row3[2] && @@row1[2]!=" " ||
            @@row1[0]==@@row2[1] && @@row1[0]==@@row3[2] && @@row1[0]!=" " ||
            @@row1[2]==@@row2[1] && @@row1[2]==@@row3[0] && @@row1[2]!=" "
            @@winning= true
            self.board
            puts "#{@@player} wins!"
        end
    end
    def self.check_draw
        if @@winning==false && @@i==9
            self.board
            puts "It's a draw!"
            @@winning=true
        end
    end
    def self.check_filled_and_play
        if @@row==1
            if @@row1[@@column]==" "
                @@row1[@@column]=@@made_play
                self.check_winning
                self.check_draw
                self.switch_player
            else
                puts "position already filled, try again"
            end
        elsif @@row==2
            if @@row2[@@column]==" "
                @@row2[@@column]=@@made_play
                self.check_winning
                self.check_draw
                self.switch_player
            else
                puts "position already filled, try again"
            end
        elsif @@row==3
            if @@row3[@@column]==" "
                @@row3[@@column]=@@made_play
                self.check_winning
                self.check_draw
                self.switch_player
            else
                puts "position already filled, try again"
            end
        end
        if @@winning== false
            self.board
        end
    end
    def self.check_valid
        if @@row>0 && @@row<=3 && @@column>=0 && @@column<3 && @@play.length==2
            return true
        else
            puts "invalid position, try again:"
            return false
        end
        self.board          
    end
    def self.switch_player
        @@i+=1
        if @@i.odd?
            @@player="Player1"
            @@made_play="X"
        else
            @@player="Player2"
            @@made_play="O"
        end
    end
    self.board
    while @@winning == false
        puts "#{@@player}\'s turn, enter row+column (ex: 12):"
        @@play=gets.chop.split("")
        @@row=@@play[0].to_i
        @@column=@@play[1].to_i-1
        if self.check_valid 
            self.check_filled_and_play
        end
    end
end