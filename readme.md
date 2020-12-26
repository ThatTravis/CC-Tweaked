<h1>Documentation for CC-Tweaked</h1>
<h3>Version 0.1</h3>

<p>*PLACEHOLDER TABLE OF CONTENT*</p>


<h2>1. Turtle<h2>
<p>> The Turtle requires to be a wireless mining turtle with a wireless modem on the left. 
> It is also required to have a gps setup running for the turtle to find its position.<br>
</p>

<h3>1.1 mine()</h3>
<p>Determines starting position</p>

<h3>1.1 dropAndRefuel()</h3>
<p>Requires the Turtle to have an ender chest in slots 15 and 16 respectively.<br>
Slot 15: Empty ender chest for dumping items<br>
Slot 16: Ender Chest containing coal as fuel<br>
The Turtle places from Slot 15 first and dumps inventory slots 1 to 14 and gets the chest back. Then it places slot 16, takes 64 coal, refuels itself and gets the chest back. Switches to Slot 1 last.</p>

<h3>1.1 transmitData()</h3>
<p>data = {x, y, z, fuel}<br>
The Turtle sends data as a table containing its position and fuel level on channel 0.</p>


<h2>2. Data Center<h2>
<p>> The data center needs to contain at least a computer, wireless modem and screen.</p>

<h3>2.1 wrapPeripherals()</h3>
<p>Setting up a wireless modem and screen.</p>

<h3>2.2 receiveData()</h3>
<p>The Computer receives a data pack containing the position of the turtle and it's fuel level on channel 0.</p>