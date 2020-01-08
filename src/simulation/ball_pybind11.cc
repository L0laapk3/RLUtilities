#include "simulation/ball.h"

#include <pybind11/pybind11.h>
void init_ball(pybind11::module & m) {
	pybind11::class_<Ball>(m, "Ball")
		.def(pybind11::init<>())
		.def(pybind11::init<const Ball &>())
		.def_readwrite("position", &Ball::position)
		.def_readwrite("velocity", &Ball::velocity)
		.def_readwrite("angular_velocity", &Ball::angular_velocity)
		.def_readwrite("time", &Ball::time)
		.def_readonly_static("restitution", &Ball::restitution)
		.def_readonly_static("drag", &Ball::drag)
		.def_readonly_static("friction", &Ball::mu)
		.def_readonly_static("mass", &Ball::m)
		.def_readonly_static("moment_of_inertia", &Ball::I)
		.def_readonly_static("max_speed", &Ball::v_max)
		.def_readonly_static("max_omega", &Ball::w_max)
		.def_readonly_static("radius", &Ball::radius)
		.def_readonly_static("collision_radius", &Ball::collision_radius)
		.def("hitbox", &Ball::hitbox)
		.def("step", static_cast<bool (Ball::*)(float)>(&Ball::step))
		.def("collide", static_cast<bool (Ball::*)(const Car &, bool)>(&Ball::collide))
		.def("step", static_cast<bool (Ball::*)(float, const Car &)>(&Ball::step));
}
