/*----------------------------------------------------------------------------
  CCS2200 Logic Programming
  Porfolio Submission Fall 2024
  Student ID: CSY23101
  Date of submission: 
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  EXERCISE NUMBER:  i.e. 1,2, etc.
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: e.g. parent/2 (where /2 is the arity of the predicate)
  TEXTUAL DECRIPTION: i.e. a brief description of what each predicate does
  QUERIES & ANSWERS:
  Here you state the queries you used to test your program and
  you copy-paste the answers that Prolog provies to these queries, e.g.
  ? parent(zeus,X).
  X=athena;
  X=aphrodite,
  false
  ADDITIONAL COMMENTS: i.e. any additional comments about the exercise or 
  any textual answers requested by the exercise
----------------------------------------------------------------------------*/

% You write the Prolog code for each predicate here
% In code all comments should be line commens like this
% You do the same for every predicate for every exercise in the portfolio

% Computers
computer(1, 'CompA', 'Intel', 'Core i5', 'NVIDIA GTX 1050', 16, 512, 'Windows 10').
computer(2, 'CompB', 'AMD', 'Ryzen 5', 'AMD Radeon RX', 8, 256, 'Ubuntu 20.04').
computer(3, 'CompC', 'Intel', 'Core i7', 'NVIDIA GTX 1650', 16, 1024, 'Windows 11').
computer(4, 'CompD', 'AMD', 'Ryzen 7', 'AMD Radeon RX', 32, 512, 'Fedora 34').
computer(5, 'CompE', 'Intel', 'Core i3', 'NVIDIA GTX 960', 4, 128, 'Debian 10').
computer(6, 'CompF', 'ARM', 'ARM Cortex A72', 'Integrated', 4, 64, 'Android 11').
computer(7, 'CompG', 'Intel', 'Core i9', 'NVIDIA RTX 3070', 64, 2048, 'macOS Ventura').
computer(8, 'CompH', 'AMD', 'Ryzen 3', 'AMD Radeon Vega', 8, 256, 'Ubuntu 18.04').
computer(9, 'CompI', 'Apple', 'M1 Pro', 'Integrated', 16, 512, 'macOS Monterey').
computer(10, 'CompJ', 'Intel', 'Xeon W', 'NVIDIA Quadro', 128, 4096, 'Windows Server').

% Connections
connected('CompA', 'CompB').
connected('CompA', 'CompC').
connected('CompB', 'CompD').
connected('CompC', 'CompE').
connected('CompD', 'CompF').
connected('CompE', 'CompG').
connected('CompF', 'CompH').
connected('CompG', 'CompI').
connected('CompH', 'CompJ').
connected('CompI', 'CompA').

% Subnet Memberships
subnet('CompA', 'OfficeNet').
subnet('CompB', 'OfficeNet').
subnet('CompC', 'DevNet').
subnet('CompD', 'DevNet').
subnet('CompE', 'StorageNet').
subnet('CompF', 'StorageNet').
subnet('CompG', 'RenderFarm').
subnet('CompH', 'RenderFarm').
subnet('CompI', 'CloudNet').
subnet('CompJ', 'CloudNet').
subnet('CompC', 'OfficeNet').
subnet('CompA', 'DevNet').

% CPU Operating System Recommendations
recommended_os('Core i5', 'Windows 10').
recommended_os('Core i7', 'Windows 11').
recommended_os('Core i3', 'Debian 10').
recommended_os('Core i9', 'macOS Ventura').
recommended_os('Xeon W', 'Windows Server').
recommended_os('Ryzen 5', 'Ubuntu 20.04').
recommended_os('Ryzen 7', 'Fedora 34').
recommended_os('Ryzen 3', 'Ubuntu 18.04').
recommended_os('ARM Cortex A72', 'Android 11').
recommended_os('M1 Pro', 'macOS Monterey').

%1 neighbor/2
% Get neighbor of a computer
neighbor(Name, Neighbor) :-
connected(Name, Neighbor);
connected(Neighbor, Name).

% name/2
% Get name of computer by number
name(Number, Name) :- 
computer(Number, Name, _, _, _, _, _, _).

% middle/3
% Get middle computer between two others
middle(A, B, C) :- 
neighbor(A, C),
neighbor(B, C),
A\=C,
B\=C.

% netNeighbor/2
% Get neighbor of a computer in the subnet
netNeighbor(Name, Neighbor) :-
subnet(Name, Subnet),
subnet(Neighbor, Subnet),
Name\=Neighbor.

