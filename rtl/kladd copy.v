                OUTPUT: begin
                    stateCount <= stateCount + 1;
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    Lcharged <= 0;
                    Hcharged <= 0;
                    if (count > 3) begin
                        count <= 0;
                        if (stateCount > 10) begin
                            parentState <= PTAT;
                            afterBlank <= BLANKBIGDIODE;
                            childState <= BLANKDIODE;
                            stateCount <= 0;
                            s_BgCtrl <= 0;
                            s_Rdiscon_N <= 0;
                            count <= 0;
                            PA <= 0;
                            PB <= 0;
                            PC <= 0;
                            PD <= 0;
                        end else begin
                            childState <= BLANKBIGDIODE;
                            afterBlank <= BIGDIODE;
                        end
                    end else begin
                        count <= count + 1;
                    end
                end