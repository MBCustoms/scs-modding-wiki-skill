# Collision Locators

Collision locators are employed for simulating realistic physical interactions between objects in game. There are four types of primitives: **Box**, **Sphere**, **Capsule** and **Cylinder**. Beside primitives there is also special type of collision locator named **Convex** which uses convex geometry instead.

Each locator object has its own display options which will set rendering mode of locator in 3D view. You can switch rendering of wire frame (**Wireframes**) and shell (**Faces**) of locator.

All primitive collision locators have **Locator Centered** property, which will position primitive to center of locator.

All types also features physical property **Mass Weight** which specifies mass of the object.

## Box

- **X/Y/Z Dimension** - size of the body on each axis.

## Sphere

- **Sphere Diameter** - size of the sphere.

## Capsule

- **Capsule Diameter** - size of the capsule ending.
- **Capsule Length** - length of the capsule body.

## Cylinder

- **Cylinder Diameter** - diameter of cylinder.
- **Cylinder Length** - length of cylinder body.

## Convex

- **Collision Margin** - scales the convex envelope by the same distance on all axis.

Convex locator features additional info line which tells you how many vertices is in this convex locator.

For easy convex locator creation, please see the section SCS Tools in Tool Shelf#Convex.

> **Note:** "Keep in mind that convex locator should have really small amount of vertices (ideally up to 64 vertices) because of expensive calculations in game."
