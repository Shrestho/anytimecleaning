import React from "react";
import { NavLink, useMatch, useResolvedPath } from "react-router-dom";

function CustomLink({ children, to, ...props }) {
  let resolved = useResolvedPath(to);
  let match = useMatch({ path: resolved.pathname, end: true });

  return (
    <NavLink
      className={`${match} ${
        match ? "text-[#00cfc1] font-semibold" : "text-black"
      } text-lg block py-2 px-4 hover:text-[#00cfc1] hover:underline`}
      to={to}
      {...props}
    >
      {children}
    </NavLink>
  );
}

export default CustomLink;
