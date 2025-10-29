# Zig 설명서

https://ziglang.org/documentation/master/

# zig의 메모리 관리 C와 비교해서 설명 잘됨.

https://www.reddit.com/r/Zig/comments/iu37eg/how_is_managing_memory_in_zig_different_than_c/

- 메모리 destroy설명 굿
  - https://github.com/ziglang/zig/blob/fbde15fdf41024d977401ab2a5c52e60b67d48fa/lib/std/mem/Allocator.zig#L169
 

<hr />

# Primitive Types
- https://ziglang.org/documentation/master/#Primitive-Types

<table>
        <thead>
            <tr>
            <th scope="col">Type</th>
            <th scope="col">C Equivalent</th>
            <th scope="col">Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row"><code><span class="tok-type">i8</span></code></th>
          <td><code class="c">int8_t</code></td>
          <td>signed 8-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">u8</span></code></th>
          <td><code class="c">uint8_t</code></td>
          <td>unsigned 8-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">i16</span></code></th>
          <td><code class="c">int16_t</code></td>
          <td>signed 16-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">u16</span></code></th>
          <td><code class="c">uint16_t</code></td>
          <td>unsigned 16-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">i32</span></code></th>
          <td><code class="c">int32_t</code></td>
          <td>signed 32-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">u32</span></code></th>
          <td><code class="c">uint32_t</code></td>
          <td>unsigned 32-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">i64</span></code></th>
          <td><code class="c">int64_t</code></td>
          <td>signed 64-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">u64</span></code></th>
          <td><code class="c">uint64_t</code></td>
          <td>unsigned 64-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">i128</span></code></th>
          <td><code class="c">__int128</code></td>
          <td>signed 128-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">u128</span></code></th>
          <td><code class="c">unsigned __int128</code></td>
          <td>unsigned 128-bit integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">isize</span></code></th>
          <td><code class="c">intptr_t</code></td>
          <td>signed pointer sized integer</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">usize</span></code></th>
          <td><code class="c">uintptr_t</code>, <code class="c">size_t</code></td>
          <td>unsigned pointer sized integer. Also see <a href="https://github.com/ziglang/zig/issues/5185">#5185</a></td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_char</span></code></th>
          <td><code class="c">char</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_short</span></code></th>
          <td><code class="c">short</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_ushort</span></code></th>
          <td><code class="c">unsigned short</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_int</span></code></th>
          <td><code class="c">int</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_uint</span></code></th>
          <td><code class="c">unsigned int</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_long</span></code></th>
          <td><code class="c">long</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_ulong</span></code></th>
          <td><code class="c">unsigned long</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_longlong</span></code></th>
          <td><code class="c">long long</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_ulonglong</span></code></th>
          <td><code class="c">unsigned long long</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">c_longdouble</span></code></th>
          <td><code class="c">long double</code></td>
          <td>for ABI compatibility with C</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">f16</span></code></th>
          <td><code class="c">_Float16</code></td>
          <td>16-bit floating point (10-bit mantissa) IEEE-754-2008 binary16</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">f32</span></code></th>
          <td><code class="c">float</code></td>
          <td>32-bit floating point (23-bit mantissa) IEEE-754-2008 binary32</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">f64</span></code></th>
          <td><code class="c">double</code></td>
          <td>64-bit floating point (52-bit mantissa) IEEE-754-2008 binary64</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">f80</span></code></th>
          <td><code class="c">long double</code></td>
          <td>80-bit floating point (64-bit mantissa) IEEE-754-2008 80-bit extended precision</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">f128</span></code></th>
            <td><code class="c">_Float128</code></td>
          <td>128-bit floating point (112-bit mantissa) IEEE-754-2008 binary128</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">bool</span></code></th>
          <td><code class="c">bool</code></td>
          <td><code><span class="tok-null">true</span></code> or <code><span class="tok-null">false</span></code></td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">anyopaque</span></code></th>
          <td><code class="c">void</code></td>
          <td>Used for type-erased pointers.</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">void</span></code></th>
          <td>(none)</td>
          <td>Always the value <code><span class="tok-type">void</span>{}</code></td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">noreturn</span></code></th>
          <td>(none)</td>
          <td>the type of <code><span class="tok-kw">break</span></code>, <code><span class="tok-kw">continue</span></code>, <code><span class="tok-kw">return</span></code>, <code><span class="tok-kw">unreachable</span></code>, and <code><span class="tok-kw">while</span> (<span class="tok-null">true</span>) {}</code></td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">type</span></code></th>
          <td>(none)</td>
          <td>the type of types</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">anyerror</span></code></th>
          <td>(none)</td>
          <td>an error code</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">comptime_int</span></code></th>
          <td>(none)</td>
          <td>Only allowed for <a href="https://ziglang.org/documentation/master/#comptime">comptime</a>-known values. The type of integer literals.</td>
        </tr>
        <tr>
            <th scope="row"><code><span class="tok-type">comptime_float</span></code></th>
          <td>(none)</td>
          <td>Only allowed for <a href="https://ziglang.org/documentation/master/#comptime">comptime</a>-known values. The type of float literals.</td>
        </tr>
        </tbody>
</table>
