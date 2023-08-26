////////////////////////////////////
//* ROUTER CONFIGURATION OPTIONS *//
////////////////////////////////////

`include "define.v" 

/* Arbiter Configurations */
`define ARBITER_TYPE  `FIXED_PRIORITY

/* Priority Configuration
 * North:0, East:1, West:3, South:2, Eject:4 
 */
`define PRI_0    `EJECT
`define PRI_1    `WEST       
`define PRI_2    `NORTH
`define PRI_3    `EAST
`define PRI_4    `SOUTH

/* Routing Algorithm */
`define ROUTING_ALGORITHM  `YX_DOR

/* Mesh size */
`define ROW     4
`define COLUMN  5
`define ROUTER_NUM  `ROW *`COLUMN
`define MAX_ROUTER  `ROUTER_NUM - 1