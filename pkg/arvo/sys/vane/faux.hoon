!:
!?  143
::  A faux vane that allows to increase or decrease a named counter
::  in the register, and supports scrying of the register.
::  .^((list @tas @ud) %fx /===/register)  -- list all registers
::  .^(@ud %fx /===/register/reg)          -- query value of register reg
::
=,  faux
|=  our=ship
=>  |%
    +$  move  [p=duct q=(wite note gift)]
    +$  note  ~
    +$  sign  ~
    ::
    +$  faux-state
      $:  register=(map @tas @ud)
      ==
    --
::
=|  faux-state
=*  state  -
|=  [now=@da eny=@uvJ rof=roof]
=*  faux-gate  .
^?
|%
::  +call: handle a +task:faux request
::
++  call
  |=  $:  hen=duct
          dud=(unit goof)
          wrapped-task=(hobo task)
      ==
  ^-  [(list move) _faux-gate]
  =/  =task  ((harden task) wrapped-task)
  ~&   faux-call+[hen dud task]
  ?+  -.task  `faux-gate
    %inc
      =.  register.state
        =+  val=(~(get by register.state) reg.task)
        ?~  val
          (~(put by register.state) reg.task 0)
        (~(put by register.state) reg.task +(u.val))
      `faux-gate
    %dec
      =.  register.state
        =+  val=(~(get by register.state) reg.task)
        ?~  val
          ~&  faux-call-dec+%reg-not-found
          register.state
        (~(put by register.state) reg.task (dec u.val))
      `faux-gate
  ==
::  +load: migrate an old state to a new faux version
::
++  load
  |=  old=faux-state
  ^+  faux-gate
  ~&  %faux-load
  faux-gate(state old)
::
++  scry
  ^-  roon
  |=  [lyc=gang pov=path car=term bem=beam]
  ^-  (unit (unit cage))
  =*  ren  car
  =*  tyl  s.bem
  ~&  faux-scry+[lyc pov car bem]
  ::  /fx/register  (list [@tas @ud])  list all registered values 
  ::  /fx/register/[reg]  @ud  retrieve reg register value
  ?.  ?=(%x ren)  ~
  ?+  tyl  [~ ~]
    [%register ~]
      :^  ~  ~  %noun
      !>  ^-  (list [@tas @ud])
      ~(tap by register.state)
    [%register @ ~]
      =+  reg=(slaw %tas i.t.s.bem)
      ?~  reg
        [~ ~]
      ?.  (~(has by register.state) u.reg)
        [~ ~]
      :^  ~  ~  %noun
      !>  ^-  @ud
      (~(got by register.state) u.reg)
  ==
::
++  stay  ~&  %faux-stay  state
++  take
  |=  [tea=wire hen=duct dud=(unit goof) hin=sign]
  ^-  [(list move) _faux-gate]
  ~&  faux-take+[tea hen dud hin]
  `faux-gate
--
