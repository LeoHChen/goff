// +build !amd64

// Copyright 2020 ConsenSys AG
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Code generated by goff (v0.1.0) DO NOT EDIT

// Package bls377 contains field arithmetic operations
package bls377

// /!\ WARNING /!\
// this code has not been audited and is provided as-is. In particular,
// there is no security guarantees such as constant time implementation
// or side-channel attack resistance
// /!\ WARNING /!\

import "math/bits"

// Mul z = x * y mod q
// see https://hackmd.io/@zkteam/modular_multiplication
func (z *Element) Mul(x, y *Element) *Element {

	var t [6]uint64
	var c [3]uint64
	{
		// round 0
		v := x[0]
		c[1], c[0] = bits.Mul64(v, y[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd1(v, y[1], c[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd1(v, y[2], c[1])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd1(v, y[3], c[1])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd1(v, y[4], c[1])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd1(v, y[5], c[1])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 1
		v := x[1]
		c[1], c[0] = madd1(v, y[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, y[1], c[1], t[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, y[2], c[1], t[2])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, y[3], c[1], t[3])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, y[4], c[1], t[4])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, y[5], c[1], t[5])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 2
		v := x[2]
		c[1], c[0] = madd1(v, y[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, y[1], c[1], t[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, y[2], c[1], t[2])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, y[3], c[1], t[3])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, y[4], c[1], t[4])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, y[5], c[1], t[5])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 3
		v := x[3]
		c[1], c[0] = madd1(v, y[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, y[1], c[1], t[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, y[2], c[1], t[2])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, y[3], c[1], t[3])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, y[4], c[1], t[4])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, y[5], c[1], t[5])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 4
		v := x[4]
		c[1], c[0] = madd1(v, y[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, y[1], c[1], t[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, y[2], c[1], t[2])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, y[3], c[1], t[3])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, y[4], c[1], t[4])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, y[5], c[1], t[5])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 5
		v := x[5]
		c[1], c[0] = madd1(v, y[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, y[1], c[1], t[1])
		c[2], z[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, y[2], c[1], t[2])
		c[2], z[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, y[3], c[1], t[3])
		c[2], z[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, y[4], c[1], t[4])
		c[2], z[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, y[5], c[1], t[5])
		z[5], z[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}

	// if z > q --> z -= q
	// note: this is NOT constant time
	if !(z[5] < 121098312706494698 || (z[5] == 121098312706494698 && (z[4] < 14284016967150029115 || (z[4] == 14284016967150029115 && (z[3] < 1883307231910630287 || (z[3] == 1883307231910630287 && (z[2] < 2230234197602682880 || (z[2] == 2230234197602682880 && (z[1] < 1660523435060625408 || (z[1] == 1660523435060625408 && (z[0] < 9586122913090633729))))))))))) {
		var b uint64
		z[0], b = bits.Sub64(z[0], 9586122913090633729, 0)
		z[1], b = bits.Sub64(z[1], 1660523435060625408, b)
		z[2], b = bits.Sub64(z[2], 2230234197602682880, b)
		z[3], b = bits.Sub64(z[3], 1883307231910630287, b)
		z[4], b = bits.Sub64(z[4], 14284016967150029115, b)
		z[5], _ = bits.Sub64(z[5], 121098312706494698, b)
	}
	return z
}

// MulAssign z = z * x mod q
// see https://hackmd.io/@zkteam/modular_multiplication
func (z *Element) MulAssign(x *Element) *Element {

	var t [6]uint64
	var c [3]uint64
	{
		// round 0
		v := z[0]
		c[1], c[0] = bits.Mul64(v, x[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd1(v, x[1], c[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd1(v, x[2], c[1])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd1(v, x[3], c[1])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd1(v, x[4], c[1])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd1(v, x[5], c[1])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 1
		v := z[1]
		c[1], c[0] = madd1(v, x[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, x[1], c[1], t[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, x[2], c[1], t[2])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, x[3], c[1], t[3])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, x[4], c[1], t[4])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, x[5], c[1], t[5])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 2
		v := z[2]
		c[1], c[0] = madd1(v, x[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, x[1], c[1], t[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, x[2], c[1], t[2])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, x[3], c[1], t[3])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, x[4], c[1], t[4])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, x[5], c[1], t[5])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 3
		v := z[3]
		c[1], c[0] = madd1(v, x[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, x[1], c[1], t[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, x[2], c[1], t[2])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, x[3], c[1], t[3])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, x[4], c[1], t[4])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, x[5], c[1], t[5])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 4
		v := z[4]
		c[1], c[0] = madd1(v, x[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, x[1], c[1], t[1])
		c[2], t[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, x[2], c[1], t[2])
		c[2], t[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, x[3], c[1], t[3])
		c[2], t[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, x[4], c[1], t[4])
		c[2], t[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, x[5], c[1], t[5])
		t[5], t[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}
	{
		// round 5
		v := z[5]
		c[1], c[0] = madd1(v, x[0], t[0])
		m := c[0] * 9586122913090633727
		c[2] = madd0(m, 9586122913090633729, c[0])
		c[1], c[0] = madd2(v, x[1], c[1], t[1])
		c[2], z[0] = madd2(m, 1660523435060625408, c[2], c[0])
		c[1], c[0] = madd2(v, x[2], c[1], t[2])
		c[2], z[1] = madd2(m, 2230234197602682880, c[2], c[0])
		c[1], c[0] = madd2(v, x[3], c[1], t[3])
		c[2], z[2] = madd2(m, 1883307231910630287, c[2], c[0])
		c[1], c[0] = madd2(v, x[4], c[1], t[4])
		c[2], z[3] = madd2(m, 14284016967150029115, c[2], c[0])
		c[1], c[0] = madd2(v, x[5], c[1], t[5])
		z[5], z[4] = madd3(m, 121098312706494698, c[0], c[2], c[1])
	}

	// if z > q --> z -= q
	// note: this is NOT constant time
	if !(z[5] < 121098312706494698 || (z[5] == 121098312706494698 && (z[4] < 14284016967150029115 || (z[4] == 14284016967150029115 && (z[3] < 1883307231910630287 || (z[3] == 1883307231910630287 && (z[2] < 2230234197602682880 || (z[2] == 2230234197602682880 && (z[1] < 1660523435060625408 || (z[1] == 1660523435060625408 && (z[0] < 9586122913090633729))))))))))) {
		var b uint64
		z[0], b = bits.Sub64(z[0], 9586122913090633729, 0)
		z[1], b = bits.Sub64(z[1], 1660523435060625408, b)
		z[2], b = bits.Sub64(z[2], 2230234197602682880, b)
		z[3], b = bits.Sub64(z[3], 1883307231910630287, b)
		z[4], b = bits.Sub64(z[4], 14284016967150029115, b)
		z[5], _ = bits.Sub64(z[5], 121098312706494698, b)
	}
	return z
}
